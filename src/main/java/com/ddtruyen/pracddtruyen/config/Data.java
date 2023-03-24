// package com.ddtruyen.pracddtruyen.config;

// import java.time.LocalDate;

// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
// import org.springframework.boot.CommandLineRunner;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;

// import com.ddtruyen.pracddtruyen.entity.Story;
// import com.ddtruyen.pracddtruyen.service.StoryServiceImpl;

// @Configuration
// public class Data {
//   private static final Logger LOGGER = LoggerFactory.getLogger(Data.class);

//   @Bean
//   public CommandLineRunner initData(StoryServiceImpl storyServiceImpl) {
//     return new CommandLineRunner() {
//       @Override
//       public void run(String... args) throws Exception {
//         LOGGER.info("Insert data: " + storyServiceImpl.getStoryRepository().save(new Story("Doraemon", null, LocalDate.of(2020, 1, 12), "Describe Test 1")));
//         LOGGER.info("Insert data: " + storyServiceImpl.getStoryRepository().save(new Story("One Piece", null, LocalDate.of(2018, 12, 6), "Describe Test 2")));
//         LOGGER.info("Insert data: " + storyServiceImpl.getStoryRepository().save(new Story("Shin", null, LocalDate.of(2014, 11, 25), "Describe Test 3")));
//       }
//     };
//   }
// }
