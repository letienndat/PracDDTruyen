<!DOCTYPE html>
<html lang="en">

<head>
  <div th:insert="~{fragments/header :: header}"></div>
  <title>Quản lý thể loại</title>
  <link rel="stylesheet" th:href="@{/css/edit-type.css}">
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> -->
</head>

<body>
  <div th:insert="~{fragments/navigation :: navigation}"></div>
  <!-- nhập form  -->
  <section class="form-add-type">
    <div class="row d-flex justify-content-center align-items-center">
      <form th:action="@{/api/ddtruyen/edit-type?id={id}(id=${type.id})}" method="post" th:object="${type}">
        <fieldset>
          <legend>Thêm thể loại</legend>
          <div class="form-input col-12">
            <div class="form-input_name row">
              <div class="col-12">
                <p th:text="${'ID: ' + type.id}"></p>

                <h5>Tên</h5>
                <input type="text" placeholder="Nhập tên thể loại" name="name" th:value="${type.name}" required>

                <h5>Danh sách truyện</h5>
                <div class="form-add__author">
                  <div class="row">
                    <select class="selectpicker choose-author col-6" name="list-stories" multiple
                      data-live-search="true">
                      <option th:each="story : ${full_stories}" th:text="'[ID:' + ${story.id} + '] ' + ${story.title}" th:selected="${list_id_stories.contains(story.id)}">
                      </option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <button class="btn_summit btn" type="submit">Lưu thay đổi</button>
        </fieldset>
      </form>
    </div>
  </section>
</body>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->

</html>