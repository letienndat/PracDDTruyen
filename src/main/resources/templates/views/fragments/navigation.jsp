<div th:fragment="navigation">
  <div class="header">
    <header class="container">
      <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" th:href="@{/api/ddtruyen}"><span>DD</span>truyen</a>
        <!-- responsive -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navDDtruyen-header"
          aria-controls="navDDtruyen-header" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navDDtruyen-header">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" th:href="@{/api/ddtruyen}">Trang chủ<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">Liên hệ</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Thể loại
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="" th:each="dropdown_type : ${dropdown_types}"
                  th:text="${dropdown_type.name}"></a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Admin
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" th:href="@{/api/ddtruyen/add-story}">Quản lý truyện</a>
                <a class="dropdown-item" th:href="@{/api/ddtruyen/add-author}">Quản lý tác giả</a>
                <a class="dropdown-item" th:href="@{/api/ddtruyen/add-type}">Quản lý thể loại</a>
              </div>
            </li>
          </ul>
          <!-- form search  -->
          <form th:action="@{/api/ddtruyen/search_story}" class="form-search form-inline my-2 my-lg-0">
            <input class="form-search-input mr-sm-2" type="search" placeholder="Nhập truyện muốn tìm" name="keyword"
              aria-label="Search">
            <button class="button-search my-2 my-sm-0" type="submit">Tìm kiếm</button>
          </form>
        </div>
      </nav>
    </header>
  </div>
</div>