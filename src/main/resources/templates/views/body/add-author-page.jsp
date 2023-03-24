<!DOCTYPE html>
<html lang="en">

<head>
  <div th:insert="~{fragments/header :: header}"></div>
  <title>Quản lý tác giả</title>
  <link rel="stylesheet" th:href="@{/css/add-author.css}">
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> -->
</head>

<body>
  <div th:insert="~{fragments/navigation :: navigation}"></div>
  <!-- nhập form  -->
  <section class="form-add-author">
    <div class="row d-flex justify-content-center align-items-center">
      <form th:action="@{/api/ddtruyen/add-author}" enctype="multipart/form-data" th:object="${author}" method="post">
        <fieldset>
          <legend>Thêm tác giả</legend>
          <div class="form-input col-12">
            <div class="form-input_name-homeTown row">
              <div class="col-6">
                <h5>Tên</h5>
                <input type="text" placeholder="Nhập tên tác giả" name="name" required>
              </div>
              <div class="col-6">
                <h5>Quê quán
                </h5>
                <input type="text" placeholder="Nhập quê quán" name="address">
              </div>
            </div>
            <div class="form-input-avt">
              <h5>Ảnh</h5>
              <input type="file" name="avatar">
            </div>
            <div class="form-input-des">
              <h5>Mô tả</h5>
              <textarea placeholder="Nhập mô tả" name="describe_author"></textarea>
            </div>
          </div>
          <button class="btn_summit btn" type="submit">Thêm tác giả</button>
        </fieldset>
      </form>
    </div>
    <!-- hiện thi danh sách  -->
  </section>
  <div class="row">
    <section class="container list-of-author">
      <h1>
        DANH SÁCH TÁC GIẢ
      </h1>
      <div class="container">
        <div class="row col-12 row-of-author">
          <div class="col-3 list-author-item mb-5" th:each="author : ${authors}">
            <div>
              <a th:href="@{/api/ddtruyen/get-author?id={id}(id=${author.id})}">
                <img class="img-fluid"
                  th:src="@{/img/avatar-author/} + ${author.avatar == '' ? 'default.png' : author.avatar}" alt="">
              </a>
            </div>
            <div class="author-detail mt-2">
              <h5 th:text="${'ID: ' + author.id}"></h5>
              <h5 th:text="${'Tên: ' + (author.name == '' ? 'Đang cập nhật' : author.name)}"></h5>
              <h5 th:text="${'Quê quán: ' + (author.address == '' ? 'Đang cập nhật' : author.address)}"></h5>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</body>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->

</html>