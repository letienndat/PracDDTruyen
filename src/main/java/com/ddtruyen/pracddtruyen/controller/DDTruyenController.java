package com.ddtruyen.pracddtruyen.controller;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ddtruyen.pracddtruyen.dto.AuthorDTO;
import com.ddtruyen.pracddtruyen.dto.StoryDTO;
import com.ddtruyen.pracddtruyen.dto.TypeDTO;
import com.ddtruyen.pracddtruyen.entity.Author;
import com.ddtruyen.pracddtruyen.entity.Story;
import com.ddtruyen.pracddtruyen.entity.Type;
import com.ddtruyen.pracddtruyen.service.AuthorMapperUtils;
import com.ddtruyen.pracddtruyen.service.AuthorServiceImpl;
import com.ddtruyen.pracddtruyen.service.CarouselService;
import com.ddtruyen.pracddtruyen.service.StoryMapperUtils;
import com.ddtruyen.pracddtruyen.service.StoryServiceImpl;
import com.ddtruyen.pracddtruyen.service.TypeFile;
import com.ddtruyen.pracddtruyen.service.TypeMapperUtils;
import com.ddtruyen.pracddtruyen.service.TypeServiceImpl;
import com.ddtruyen.pracddtruyen.service.UploadFileUtils;

// localhost:8080/api/ddtruyen
@Controller
@RequestMapping(value = "/api/ddtruyen")
public class DDTruyenController {
  @Autowired
  private StoryServiceImpl storyServiceImpl;

  @Autowired
  private AuthorServiceImpl authorServiceImpl;

  @Autowired
  private TypeServiceImpl typeServiceImpl;

  @Autowired
  private StoryMapperUtils storyMapperUtils;

  @Autowired
  private AuthorMapperUtils authorMapperUtils;

  @Autowired
  private TypeMapperUtils typeMapperUtils;

  @Autowired
  private CarouselService carousel;

  @Autowired
  private TypeFile typeFile;

  @Autowired
  private UploadFileUtils uploadFileUtils;

  private String firstDir = System.getProperty("user.dir");

  // localhost:8080/api/ddtruyen/
  @GetMapping(value = {"/", ""})
  public String getLocal(ModelMap modelMap) {
    String dirCarousel = firstDir + "/src/main/resources/static/img/carousel";
    modelMap.addAttribute("carousels", carousel.getListCarousel(dirCarousel));
    modelMap.addAttribute("dropdown_types", typeServiceImpl.getListTypes());

    List<Story> stories = storyServiceImpl.getListStories();

    List<StoryDTO> storyDTOs = stories.stream()
        .map(i -> storyMapperUtils.convertToDTO(i))
        .collect(Collectors.toList()
    );

    for (int i = 0; i < stories.size(); i++) {
      List<AuthorDTO> authorDTOs = stories.get(i).getLinkAuthors().stream().map(j -> authorMapperUtils.convertToDTO(j)).collect(Collectors.toList());
      List<TypeDTO> typeDTOs = stories.get(i).getLinkTypes().stream().map(j -> typeMapperUtils.convertToDTO(j)).collect(Collectors.toList());
      storyDTOs.get(i).setLink_authors(new ArrayList<>(authorDTOs));
      storyDTOs.get(i).setLink_types(new ArrayList<>(typeDTOs));
    }
    
    modelMap.addAttribute("list_story_all", storyDTOs);

    return "body/local";
  }

  // localhost:8080/api/ddtruyen/add-story
  @GetMapping(value = "/add-story")
  public String addStory(ModelMap modelMap) {
    modelMap.addAttribute("story", new StoryDTO());
    modelMap.addAttribute("authors", authorServiceImpl.getListAuthors());
    modelMap.addAttribute("types", typeServiceImpl.getListTypes());
    modelMap.addAttribute("dropdown_types", typeServiceImpl.getListTypes());

    List<Story> stories = storyServiceImpl.getListStories();

    List<StoryDTO> storyDTOs = stories.stream()
        .map(i -> storyMapperUtils.convertToDTO(i))
        .collect(Collectors.toList()
    );

    for (int i = 0; i < stories.size(); i++) {
      List<AuthorDTO> authorDTOs = stories.get(i).getLinkAuthors().stream().map(j -> authorMapperUtils.convertToDTO(j)).collect(Collectors.toList());
      List<TypeDTO> typeDTOs = stories.get(i).getLinkTypes().stream().map(j -> typeMapperUtils.convertToDTO(j)).collect(Collectors.toList());
      storyDTOs.get(i).setLink_authors(new ArrayList<>(authorDTOs));
      storyDTOs.get(i).setLink_types(new ArrayList<>(typeDTOs));
    }
    
    modelMap.addAttribute("list_story_all", storyDTOs);

    return "body/add-story-page";
  }

  // localhost:8080/api/ddtruyen/add-story
  @PostMapping(value = "/add-story")
  public String addStory(
        @RequestParam(name = "title") String title,
        @RequestParam(name = "avatar") MultipartFile avatar,
        @RequestParam(name = "list-authors") Optional<String[]> listAuthors,
        @RequestParam(name = "list-types") Optional<String[]> listTypes,
        @RequestParam(name = "release_date") Optional<LocalDate> releaseDate,
        @RequestParam(name = "describe_story") String describeStory
  ) {
    
    StoryDTO storyDTO = new StoryDTO(null, title, avatar.getOriginalFilename(), releaseDate.isPresent() ? releaseDate.get() : null, describeStory, 0);

    Story story = storyMapperUtils.convertToEntity(storyDTO);

    // Link author
    List<Author> authors = new ArrayList<>();
    if(listAuthors.isPresent()) {
      for (String listAuthors2 : listAuthors.get()) {
        authors.add(authorServiceImpl.getAuthorRepository().findById(
          Integer.parseInt(listAuthors2
          .substring(listAuthors2.indexOf(":") + 1, 
          listAuthors2.indexOf("]")))
        ).get());
      }
    }

    story.setLinkAuthors(authors);

    // Link type
    List<Type> types = new ArrayList<>();
    if(listTypes.isPresent()) {
      for (String listTypes2 : listTypes.get()) {
        types.add(typeServiceImpl.getTypeRepository().findById(
          Integer.parseInt(listTypes2
          .substring(listTypes2.indexOf(":") + 1, 
          listTypes2.indexOf("]")))
        ).get());
      }
    }

    story.setLinkTypes(types);

    storyServiceImpl.getStoryRepository().save(story);

    Story storyEnd = storyServiceImpl.getListStories().get(storyServiceImpl.getListStories().size() - 1);

    if(!storyEnd.getAvatar().isEmpty()) {
      storyEnd.setAvatar(typeFile.getTypeFile(storyEnd.getAvatar()).isEmpty()
      ? String.valueOf(storyEnd.getId()) : storyEnd.getId() + "." + typeFile.getTypeFile(storyEnd.getAvatar()).get());
  
      String dirStoryAuthor = firstDir + "/src/main/resources/static/img/avatar-story";
      uploadFileUtils.handUploadFile(avatar, dirStoryAuthor, storyEnd.getAvatar());
    }
    
    storyServiceImpl.getStoryRepository().save(storyEnd);

    return "redirect:/api/ddtruyen/add-story";
  }

  // localhost:8080/api/ddtruyen/add-author
  @GetMapping(value = "/add-author")
  public String addAuthor(ModelMap modelMap) {
    modelMap.addAttribute("author", new AuthorDTO());
    modelMap.addAttribute("dropdown_types", typeServiceImpl.getListTypes());
    modelMap.addAttribute("authors", authorServiceImpl.getListAuthors().stream()
          .map(i -> authorMapperUtils.convertToDTO(i))
          .collect(Collectors.toList())
    );

    return "body/add-author-page";
  }

  //localhost:8080/api/ddtruyen/add-author
  @PostMapping(value = "/add-author")
  public String addAuthor(
      @RequestParam(name = "name") String name,
      @RequestParam(name = "avatar") MultipartFile avatar,
      @RequestParam(name = "address") String address,
      @RequestParam(name = "describe_author") String describeAuthor
  ) {
    AuthorDTO authorDTO = new AuthorDTO(null, name, avatar.getOriginalFilename(), address, describeAuthor);

    authorServiceImpl.getAuthorRepository().save(authorMapperUtils.convertToEntity(authorDTO));

    Author authorEnd = authorServiceImpl.getListAuthors().get(authorServiceImpl.getListAuthors().size() - 1);

    if(!authorEnd.getAvatar().isEmpty()) {
      authorEnd.setAvatar(typeFile.getTypeFile(authorEnd.getAvatar()).isEmpty()
      ? String.valueOf(authorEnd.getId()) : authorEnd.getId() + "." + typeFile.getTypeFile(authorEnd.getAvatar()).get());
    
      String dirStoryAuthor = firstDir + "/src/main/resources/static/img/avatar-author";
      uploadFileUtils.handUploadFile(avatar, dirStoryAuthor, authorEnd.getAvatar());
    }

    authorServiceImpl.getAuthorRepository().save(authorEnd);

    return "redirect:/api/ddtruyen/add-author";
  }

  // localhost:8080/api/ddtruyen/add-type
  @GetMapping(value = "/add-type")
  public String addType(ModelMap modelMap) {
    modelMap.addAttribute("type", new TypeDTO());
    modelMap.addAttribute("dropdown_types", typeServiceImpl.getListTypes());

    List<TypeDTO> typeDTOs = typeServiceImpl.getListTypes().stream()
          .map(i -> typeMapperUtils.convertToDTO(i))
          .collect(Collectors.toList()
    );

    for (int i = 0; i < typeServiceImpl.getListTypes().size(); i++) {
      typeDTOs.get(i).setLink_stories(
        typeServiceImpl.getListTypes().get(i)
        .getLinkStories().stream()
        .map(j -> storyMapperUtils.convertToDTO(j))
        .collect(Collectors.toList())
      );
    }

    modelMap.addAttribute("types", typeDTOs);

    return "body/add-type-page";
  }

  // localhost:8080/api/ddtruyen/add-type
  @PostMapping(value = "/add-type")
  public String addType(@ModelAttribute(name = "type") TypeDTO typeDTO) {
    typeServiceImpl.getTypeRepository().save(typeMapperUtils.convertToEntity(typeDTO));

    return "redirect:/api/ddtruyen/add-type";
  }

  // localhost:8080/api/ddtruyen/get-author?id=
  @GetMapping(value = "/get-author")
  public String getAuthor(@RequestParam(name = "id") Author author, ModelMap modelMap) {
    List<StoryDTO> storyDTOs = author.getLinkStories().stream()
        .map(i -> storyMapperUtils.convertToDTO(i))
        .collect(Collectors.toList());
      
    AuthorDTO authorDTO = authorMapperUtils.convertToDTO(author);
    authorDTO.setLink_stories(storyDTOs);

    modelMap.addAttribute("author", authorDTO);
    modelMap.addAttribute("dropdown_types", typeServiceImpl.getListTypes());

    return "body/author-detail";
  }

  // localhost:8080/api/ddtruyen/get-story?id=
  @ResponseBody
  @GetMapping(value = "/get-story")
  public String getStory(@RequestParam(name = "id") Story story, ModelMap modelMap) {
    List<AuthorDTO> authorDTOs = story.getLinkAuthors().stream()
        .map(i -> authorMapperUtils.convertToDTO(i))
        .collect(Collectors.toList());

    List<TypeDTO> typeDTOs = story.getLinkTypes().stream()
        .map(i -> typeMapperUtils.convertToDTO(i))
        .collect(Collectors.toList());
      
    StoryDTO storyDTOs = storyMapperUtils.convertToDTO(story);
    storyDTOs.setLink_authors(authorDTOs);
    storyDTOs.setLink_types(typeDTOs);

    modelMap.addAttribute("author", storyDTOs);

    return storyDTOs.toString();
  }

  // localhost:8080/api/ddtruyen//search-story?keyword=
  @ResponseBody
  @GetMapping(value = "/search-story")
  public String searchStoryByKeyword(@RequestParam(name = "keyword") String keyword, ModelMap modelMap) {
    List<Story> stories = storyServiceImpl.getListStories();

    List<Story> resStories = new ArrayList<>();

    keyword = keyword.toLowerCase().trim();

    for (Story story : stories) {
      if (String.valueOf(story.getId()).equalsIgnoreCase(keyword) 
          || story.getTitle().toLowerCase().contains(keyword)) {
        resStories.add(story);
      }
    }

    List<StoryDTO> resStoryDTOs = resStories.stream()
        .map(i -> storyMapperUtils.convertToDTO(i))
        .collect(Collectors.toList()
    );

    for (int i = 0; i < resStories.size(); i++) {
      List<AuthorDTO> authorDTOs = stories.get(i).getLinkAuthors().stream().map(j -> authorMapperUtils.convertToDTO(j)).collect(Collectors.toList());
      List<TypeDTO> typeDTOs = stories.get(i).getLinkTypes().stream().map(j -> typeMapperUtils.convertToDTO(j)).collect(Collectors.toList());
      resStoryDTOs.get(i).setLink_authors(new ArrayList<>(authorDTOs));
      resStoryDTOs.get(i).setLink_types(new ArrayList<>(typeDTOs));
    }
    
    modelMap.addAttribute("resStories", resStoryDTOs);

    return resStoryDTOs.toString();
  }

  // localhost:8080/api/ddtruyen/delete-author?id=
  @GetMapping(value = "/delete-author")
  public String deleteAuthor(@RequestParam(name = "id") Author author) {
    storyServiceImpl.getListStories().forEach(i -> {
      i.getLinkAuthors().remove(author);
    });

    authorServiceImpl.getAuthorRepository().delete(author);

    String dirAvatarAuthor = firstDir + "/src/main/resources/static/img/avatar-author/";

    try {
      Files.delete(Paths.get(dirAvatarAuthor + author.getAvatar()));
    } catch (Exception e) {
      e.printStackTrace();
    }

    return "redirect:/api/ddtruyen/add-author";
  }

  // localhost:8080/api/ddtruyen/delete-story?id=
  @GetMapping(value = "/delete-story")
  public String deleteStory(@RequestParam(name = "id") Story story) {
    authorServiceImpl.getListAuthors().forEach(i -> {
      i.getLinkStories().remove(story);
    });

    typeServiceImpl.getListTypes().forEach(i -> {
      i.getLinkStories().remove(story);
    });

    storyServiceImpl.getStoryRepository().delete(story);

    String dirAvatarAuthor = firstDir + "/src/main/resources/static/img/avatar-story/";

    try {
      Files.delete(Paths.get(dirAvatarAuthor + story.getAvatar()));
    } catch (Exception e) {
      e.printStackTrace();
    }

    return "redirect:/api/ddtruyen/add-story";
  }

  // localhost:8080/api/ddtruyen/delete-type?id=
  @GetMapping(value = "delete-type")
  public String deleteType(@RequestParam(name = "id") Type type) {
    storyServiceImpl.getListStories().forEach(i -> {
      i.getLinkTypes().remove(type);
    });

    typeServiceImpl.getTypeRepository().delete(type);

    return "redirect:/api/ddtruyen/add-type";
  }

  // localhost:8080/api/ddtruyen/edit-type?id=
  // chưa xong sửa thể loại
  // cần thêm sửa những truyện của thể loại (xóa truyện khỏi thể loại)
  @GetMapping(value = "edit-type")
  public String editType(@RequestParam(name = "id") Type type, ModelMap modelMap) {
    TypeDTO typeDTO = typeMapperUtils.convertToDTO(type);

    // danh sách các truyện của thể loại
    typeDTO.setLink_stories(
      typeServiceImpl.getTypeRepository()
      .findById(type.getId()).get()
      .getLinkStories().stream()
      .map(j -> storyMapperUtils.convertToDTO(j))
      .collect(Collectors.toList())
    );

    modelMap.addAttribute("type", typeDTO);

    // Danh sách tất cả các truyện
    modelMap.addAttribute("full_stories", storyServiceImpl.getListStories()
          .stream().map(i -> storyMapperUtils.convertToDTO(i)).collect(Collectors.toList())
    );

    modelMap.addAttribute("list_id_stories", typeServiceImpl.getTypeRepository()
          .findById(type.getId()).get().getLinkStories()
          .stream().map(j -> storyMapperUtils.convertToDTO(j))
          .collect(Collectors.toList())
          .stream().map(StoryDTO::getId)
          .collect(Collectors.toList())
    );

    return "body/edit-type";
  }

  // localhost:8080/api/ddtruyen/edit-type?id=
  @PostMapping(value = "edit-type")
  public String editType(
          @ModelAttribute(name = "type") TypeDTO typeDTO, 
          @RequestParam(name = "id") Integer id, 
          @RequestParam(name = "list-stories") Optional<String[]> listStories
    ) {
    Type typeUpdate = typeServiceImpl.getTypeRepository().findById(id).get();
    typeUpdate.setName(typeDTO.getName());

    // Link author
    List<Story> stories = new ArrayList<>();
    if(listStories.isPresent()) {
      for (String story : listStories.get()) {
        stories.add(storyServiceImpl.getStoryRepository().findById(
          Integer.parseInt(story
          .substring(story.indexOf(":") + 1, 
          story.indexOf("]")))
        ).get());
      }
    }

    // Đang lỗi, thêm được vào danh sách nhưng chưa thêm vào database được
    typeUpdate.setLinkStories(stories);
    
    typeServiceImpl.getTypeRepository().save(typeUpdate);

    return "redirect:/api/ddtruyen/add-type";
  }

  // localhost:8080/api/ddtruyen/edit-author?id=
  @GetMapping(value = "edit-author")
  public String editAuthor(@RequestParam(name = "id") Author author, ModelMap modelMap) {
    modelMap.addAttribute("author", authorMapperUtils.convertToDTO(author));

    return "body/edit-author";
  }

  // localhost:8080/api/ddtruyen/edit-author?id=
  @PostMapping(value = "edit-author")
  public String editAuthor(@ModelAttribute(name = "author") AuthorDTO authorDTO, @RequestParam(name = "id") Integer id) {
    Author authorUpdate = authorServiceImpl.getAuthorRepository().findById(id).get();
    authorUpdate.setName(authorDTO.getName());
    authorUpdate.setAddress(authorDTO.getAddress());
    authorUpdate.setDescribe_author(authorDTO.getDescribe_author());
    // chưa xong

    return "redirect:/api/ddtruyen/add-author";
  }
}
