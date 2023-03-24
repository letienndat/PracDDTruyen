<!DOCTYPE html>
<html lang="en">

<head>
  <div th:insert="~{fragments/header :: header}"></div>
  <title>Quản lý truyện</title>
  <link rel="stylesheet" th:href="@{/css/add-story.css}">
</head>

<body>
  <div th:insert="~{fragments/navigation :: navigation}"></div>
    <!-- nhập form  -->
  <section class="form-add-manga container">
    <div class="row">
      <form th:action="@{/api/ddtruyen/add-story}" enctype="multipart/form-data" method="post" th:object="${story}"
        class="col-12">
        <fieldset>
          <legend>Thêm truyện</legend>
          <div class="form-input-1">
            <div class="form-input__name-add-author col-12 row">
              <div class="form-input__name col-6 ">
                <h5>Tên</h5>
                <input type="text" name="title" placeholder="Nhập tên truyện" required>
              </div>
              <div class="col-6">
                <h5>Tác giả</h5>
                <div class="form-add__author">
                  <div class="row">
                    <select class="selectpicker choose-author col-6" name="list-authors" multiple
                      data-live-search="true">
                      <option th:each="author : ${authors}" th:text="'[ID:' + ${author.id} + '] ' + ${author.name}">
                      </option>
                    </select>
                    <div class="form-add-link__author col-6">
                      <a th:href="@{/api/ddtruyen/add-author}" target="_blank">Thêm tác giả</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-input-2">
            <div class="form-input__date-add-type col-12 row">
              <div class="form-input__date col-6 ">
                <h5>Thời gian phát hành</h5>
                <input type="date" name="release_date">
              </div>
              <div class="col-6">
                <h5>Thể loại</h5>
                <div class="form-add__type">
                  <div class="row">
                    <select class="selectpicker choose-author col-6" name="list-types" multiple
                      data-live-search="true">
                      <option th:each="type : ${types}" th:text="'[ID:' + ${type.id} + '] ' + ${type.name}"></option>
                    </select>
                    <div class="form-add-link__author col-6">
                      <a th:href="@{/api/ddtruyen/add-type}" target="_blank">Thêm thể loại</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="form-input__avt col-12 row">
            <div class="form-input__add-avt col-12">
              <h5>Thêm avt</h5>
              <input type="file" name="avatar">
            </div>
          </div>
          <div class="form-input__des row col-12">
            <div class="form-input__add-descibe col-12">
              <h5>Mô tả</h5>
              <textarea name="describe_story" cols="50" rows="4"
                placeholder="Nhập mô tả"></textarea>
            </div>
          </div>
          <div class="row col-12 d-flex justify-content-center">
            <button class="btn_summit btn" type="submit">Thêm truyện</button>
          </div>
    </div>
    </fieldset>
    </form>
    </div>
  </section>
  <section class="list-of-manga">
    <h1 class="list-of-manga__tittle">DANH SÁCH TRUYỆN </h1>
    <div class="container">
      <div class="row row-of-manga">
        <div class="col-sm-3 mb-4 list-manga-item" th:each="story_all : ${list_story_all}">
          <div>
            <a th:href="@{/api/ddtruyen/get-story?id={id}(id=${story_all.id})}">
              <img class="img-fluid"
                th:src="@{/img/avatar-story/} + ${story_all.avatar == '' ? 'default.png' : story_all.avatar}" alt="">
            </a>
          </div>
          <div class="list-manga-item__detail mt-2">
            <h3 th:text="${story_all.title}"></h3>
            <h5>
              <p style="float: left;">Tác giả: &nbsp</p>
              <p style="float: left;" th:text="${story_all.link_authors.isEmpty ? 'Đang cập nhật' : ''}"></p>
              <p style="float: left;" th:each="author : ${story_all.link_authors}"
                th:text="${author!=story_all.link_authors[story_all.link_authors.size - 1] ? author.name + ', &nbsp' : author.name}">
              </p>
            </h5>
            <h5>
              <p style="float: left;">Thể loại: &nbsp</p>
              <p style="float: left;" th:text="${story_all.link_types.isEmpty ? 'Đang cập nhật' : ''}"></p>
              <p style="float: left;" th:each="type : ${story_all.link_types}"
                th:text="${type!=story_all.link_types[story_all.link_types.size - 1] ? type.name + ', &nbsp' : type.name}">
              </p>
            </h5>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>