<!DOCTYPE html>
<html lang="en">

<head>
    <div th:insert="~{fragments/header :: header}"></div>
    <title th:text="${author.id + ' | ' + author.name}"></title>
    <link rel="stylesheet" th:href="@{/css/author-detail.css}">
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> -->
</head>

<body>
    <div th:insert="~{fragments/navigation :: navigation}"></div>
    <section class="detail-author container">
        <div class="detail-author__information row" th:object="${author}">
            <div class="author-avt col-3">
                <img class="img-fluid" th:src="@{/img/avatar-author/} + ${author.avatar}" alt="">
            </div>
            <div class="author-other-infor col-9">
                <h5 th:text="${'ID: ' + author.id}"></h5>
                <h5 th:text="${'Tên: ' + (author.name == '' ? 'Đang cập nhật' : author.name)}"></h5>
                <h5 th:text="${'Quê quán: ' + (author.address == '' ? 'Đang cập nhật' : author.address)}"></h5>
                <h5 th:text="${'Mô tả: ' + (author.describe_author == '' ? 'Đang cập nhật' : author.describe_author)}"></h5>
            </div>
            <div class="row">
                <section class="container list-of-author">
                    <h1>
                        DANH SÁCH TRUYỆN CỦA TÁC GIẢ
                    </h1>
                    <div class="container">
                        <div class="row col-12 row-of-author">
                            <div class="col-3 list-author-item mb-5" th:each="story : ${author.link_stories}">
                                <a th:href="@{/api/ddtruyen/get-story?id={id}(id=${story.id})}">
                                    <img class="img-fluid" th:src="@{/img/avatar-story/} + ${story.avatar == '' ? 'default.png' : story.avatar}" alt="">
                                </a>
                                <div class="story-detail mt-2">
                                    <h3 th:text="${story.title == '' ? 'Đang cập nhật' : story.title}"></h3>
                                    <h5 th:text="${'Ngày phát hành: ' + (story.release_date == '' ? 'Đang cập nhật' : story.release_date)}"></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
    </section>
</body>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script> -->

</html>