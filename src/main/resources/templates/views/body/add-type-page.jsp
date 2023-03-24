<!DOCTYPE html>
<html lang="en">

<head>
  <div th:insert="~{fragments/header :: header}"></div>
  <title>Quản lý thể loại</title>
  <link rel="stylesheet" th:href="@{/css/add-type.css}">
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> -->
</head>

<body>
  <div th:insert="~{fragments/navigation :: navigation}"></div>
    <!-- nhập form  -->
  <section class="form-add-type">
    <div class="row d-flex justify-content-center align-items-center">
      <form th:action="@{/api/ddtruyen/add-type}" method="post" th:object="${type}">
        <fieldset>
          <legend>Thêm thể loại</legend>
          <div class="form-input col-12">
            <div class="form-input_name row">
              <div class="col-12">
                <h5>Tên</h5>
                <input type="text" placeholder="Nhập tên thể loại" name="name" required>
              </div>
            </div>
          </div>
          <button class="btn_summit btn" type="submit">Thêm thể loại</button>
        </fieldset>
      </form>
    </div>
  </section>
  <section class="container list-of-type">
    <h1>
      DANH SÁCH THỂ LOẠI
    </h1>
    <div>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Tên thể loại</th>
            <th scope="col">Số truyện</th>
            <th scope="col">Tùy chọn</th>
          </tr>
        </thead>
        <tbody>
          <tr th:each="type : ${types}">
            <th scope="row" th:text="${type.id}"></th>
            <td th:text="${type.name}"></td>
            <td th:text="${type.link_stories.size}"></td>
            <td>
              <a th:href="@{/api/ddtruyen/edit-type?id={id}(id=${type.id})}">Chỉnh sửa</a>
              <a th:href="@{/api/ddtruyen/delete-type?id={id}(id=${type.id})}">Xóa</a>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</body>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->

</html>