<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DDTruyen | Trang chủ</title>
  <link rel="stylesheet" th:href="@{https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/fontawesome.min.css}"
    integrity="sha512-cHxvm20nkjOUySu7jdwiUxgGy11vuVPE9YeK89geLMLMMEOcKFyS2i+8wo0FOwyQO/bL8Bvq1KMsqK4bbOsPnA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="preconnect" th:href="@{https://fonts.googleapis.com}">
  <link rel="preconnect" th:href="@{https://fonts.gstatic.com}" crossorigin>
  <link
    th:href="@{https://fonts.googleapis.com/css2?family=Barlow+Semi+Condensed:wght@300;500;600;700;900&family=Nunito:wght@300;400;500;600;700;900&family=Tilt+Neon&display=swap}"
    rel="stylesheet">
  <link rel="stylesheet" th:href="@{/css/owl.carousel.min.css}">
  <link rel="stylesheet" th:href="@{/css/owl.theme.default.min.css}">
  <link rel="stylesheet" th:href="@{/css/style_local.css}">
</head>

<body>
  <header>
    <div class="header__content">
      <div class="header__left">
        <div class="logo">
          <a style="text-decoration: none;" th:href="@{/api/ddtruyen}">
            <h1><span>DD</span>truyen</h1>
          </a>
        </div>
        <input type="text" placeholder="Tìm kiếm">
        <a href="#"><img src="/img/icon/search-icon.svg" alt=""></a>
      </div>
      <nav class="header__right">
        <ul>
          <li>
            <a th:href="@{/api/ddtruyen}"> <svg xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 576 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path
                  d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z" />
              </svg></i>Trang chủ
            </a>
          </li>
          <li class="dropdown">
            <a class="dropbtn" href=""> <svg xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path
                  d="M40 48C26.7 48 16 58.7 16 72v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V72c0-13.3-10.7-24-24-24H40zM192 64c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zM16 232v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V232c0-13.3-10.7-24-24-24H40c-13.3 0-24 10.7-24 24zM40 368c-13.3 0-24 10.7-24 24v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V392c0-13.3-10.7-24-24-24H40z" />
              </svg></i>Thể loại
            </a>
            <div class="dropdown-content">
              <a href="#" th:each="dropdown_type : ${dropdown_types}" th:text="${dropdown_type.name}"></a>
            </div>
          </li>
          <li class="dropdown">
            <a class="dropbtn" href=""> <svg xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                <path
                  d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z" />
              </svg></i>Admin
            </a>
            <div class="dropdown-content">
              <a th:href="@{/api/ddtruyen/add-story}">Quản lý truyện</a>
              <a th:href="@{/api/ddtruyen/add-author}">Quản lý tác giả</a>
              <a th:href="@{/api/ddtruyen/add-type}">Quản lý thể loại</a>
            </div>
          </li>
        </ul>
      </nav>
    </div>
  </header>
  <section class="carousel">
    <div class="owl-carousel owl-theme">
      <div th:each="carousel : ${carousels}" class="item">
        <img th:src="@{'/img/carousel/' + ${carousel}}" alt="">
      </div>
    </div>
  </section>
  <section class="comics">
    <div class="header__tittle">
      <h1>DANH SÁCH TRUYỆN</h1>
    </div>
    <div class="comic__content">
      <div class="comic__content-item" th:each="story_all : ${list_story_all}">
        <img th:src="@{/img/avatar-story/} + ${story_all.avatar}" alt="">
        <div class="content-item__tille">
          <h1 th:text="${story_all.title}"></h1>
          <h4>
            <p style="float: left;">Tác giả: &nbsp</p>
            <p style="float: left;" th:text="${story_all.link_authors.isEmpty ? 'Đang cập nhật' : ''}"></p>
            <p style="float: left;" th:each="author : ${story_all.link_authors}"
              th:text="${author!=story_all.link_authors[story_all.link_authors.size - 1] ? author.name + ', &nbsp' : author.name}">
            </p>
          </h4>
          <br>
          <h4>
            <p style="float: left;">Thể loại: &nbsp</p>
            <p style="float: left;" th:text="${story_all.link_types.isEmpty ? 'Đang cập nhật' : ''}"></p>
            <p style="float: left;" th:each="type : ${story_all.link_types}"
              th:text="${type!=story_all.link_types[story_all.link_types.size - 1] ? type.name + ', &nbsp' : type.name}">
            </p>
          </h4>
          <br>
        </div>
      </div>
    </div>
  </section>
  <footer>
    <div class="footer__content">
      <div class="logo">
        <h1><span>DD</span>truyen</h1>
        <p>Copyright of DDTruyen</p>
      </div>
      <div class="social">
        <a href="#" target="_blank">
          <svg xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
            <path fill="#333"
              d="M400 32H48A48 48 0 0 0 0 80v352a48 48 0 0 0 48 48h137.25V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.27c-30.81 0-40.42 19.12-40.42 38.73V256h68.78l-11 71.69h-57.78V480H400a48 48 0 0 0 48-48V80a48 48 0 0 0-48-48z" />
          </svg>
        </a>
        <a href="#" target="_blank">
          <svg xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
            <path fill="#333"
              d="M224,202.66A53.34,53.34,0,1,0,277.36,256,53.38,53.38,0,0,0,224,202.66Zm124.71-41a54,54,0,0,0-30.41-30.41c-21-8.29-71-6.43-94.3-6.43s-73.25-1.93-94.31,6.43a54,54,0,0,0-30.41,30.41c-8.28,21-6.43,71.05-6.43,94.33S91,329.26,99.32,350.33a54,54,0,0,0,30.41,30.41c21,8.29,71,6.43,94.31,6.43s73.24,1.93,94.3-6.43a54,54,0,0,0,30.41-30.41c8.35-21,6.43-71.05,6.43-94.33S357.1,182.74,348.75,161.67ZM224,338a82,82,0,1,1,82-82A81.9,81.9,0,0,1,224,338Zm85.38-148.3a19.14,19.14,0,1,1,19.13-19.14A19.1,19.1,0,0,1,309.42,189.74ZM400,32H48A48,48,0,0,0,0,80V432a48,48,0,0,0,48,48H400a48,48,0,0,0,48-48V80A48,48,0,0,0,400,32ZM382.88,322c-1.29,25.63-7.14,48.34-25.85,67s-41.4,24.63-67,25.85c-26.41,1.49-105.59,1.49-132,0-25.63-1.29-48.26-7.15-67-25.85s-24.63-41.42-25.85-67c-1.49-26.42-1.49-105.61,0-132,1.29-25.63,7.07-48.34,25.85-67s41.47-24.56,67-25.78c26.41-1.49,105.59-1.49,132,0,25.63,1.29,48.33,7.15,67,25.85s24.63,41.42,25.85,67.05C384.37,216.44,384.37,295.56,382.88,322Z" />
          </svg>
        </a>
        <a href="#" target="_blank">
          <svg xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
            <path fill="#333"
              d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-48.9 158.8c.2 2.8.2 5.7.2 8.5 0 86.7-66 186.6-186.6 186.6-37.2 0-71.7-10.8-100.7-29.4 5.3.6 10.4.8 15.8.8 30.7 0 58.9-10.4 81.4-28-28.8-.6-53-19.5-61.3-45.5 10.1 1.5 19.2 1.5 29.6-1.2-30-6.1-52.5-32.5-52.5-64.4v-.8c8.7 4.9 18.9 7.9 29.6 8.3a65.447 65.447 0 0 1-29.2-54.6c0-12.2 3.2-23.4 8.9-33.1 32.3 39.8 80.8 65.8 135.2 68.6-9.3-44.5 24-80.6 64-80.6 18.9 0 35.9 7.9 47.9 20.7 14.8-2.8 29-8.3 41.6-15.8-4.9 15.2-15.2 28-28.8 36.1 13.2-1.4 26-5.1 37.8-10.2-8.9 13.1-20.1 24.7-32.9 34z" />
          </svg>
        </a>
        <a href="#" target="_blank">
          <svg xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
            <path fill="#333"
              d="M186.8 202.1l95.2 54.1-95.2 54.1V202.1zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48zm-42 176.3s0-59.6-7.6-88.2c-4.2-15.8-16.5-28.2-32.2-32.4C337.9 128 224 128 224 128s-113.9 0-142.2 7.7c-15.7 4.2-28 16.6-32.2 32.4-7.6 28.5-7.6 88.2-7.6 88.2s0 59.6 7.6 88.2c4.2 15.8 16.5 27.7 32.2 31.9C110.1 384 224 384 224 384s113.9 0 142.2-7.7c15.7-4.2 28-16.1 32.2-31.9 7.6-28.5 7.6-88.1 7.6-88.1z" />
          </svg>
        </a>
      </div>
    </div>
  </footer>
</body>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script src="/js/owl.carousel.min.js"></script>
<script>
  $('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,

    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 3
      },
      1000: {
        items: 3
      }
    }
  })
</script>

<script language="Javascript">
  $("#home").click(function () {
    $("#content").load("home.html"); //Load all retrieved content
  });
  $("#about").click(function () {
    //Only load content from a specific node
    $("#content").load("about.html #desc");
  });
  $("#examples").click(function () {
    //More specific loading of node
    $("#content").load("examples.html #storeMain .container");
  });
</script>

</html>