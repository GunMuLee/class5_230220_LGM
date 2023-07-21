<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Checkout example · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">

    

    

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
    <script type="text/javascript">
    $(function() {
    	$("#passwd2").focusout(function() {
			let passwd = $("#passwd").val();
			let passwd2 = $("#passwd2").val();
			
			if(passwd != passwd2){
				$("#area").remove();
				
				$("#passwd2").after(
					
					 "<div style='color: red;' id='area'>"
					+ "비밀번호가 일치하지 않습니다."
					+ "</div>"
				);
			} else {
				$("#area").remove();
				$("#passwd2").after(
						
						"<div style='color: green;' id='area'>"
						+ "비밀번호가 일치합니다."
						+ "</div>"
				);
			}
			
			
		});
		
	});
    </script>
  </head>
  <body class="bg-light">

<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>회원가입</h2>
    </div>
    <div class="row g-5">
    <div class="col"></div>
      <div class="col">
        <form class="needs-validation" action="join" method="post">
          <div class="row g-3">
            <div class="col-12">
              <label for="username" class="form-label">아이디</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="id" name="id" placeholder="아아디 작성" required>
              </div>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호 작성" required>
            </div>

            <div class="col-12">
              <label for="address2" class="form-label">비밀번호 확인<span class="text-muted"></span></label>
              <input type="password" class="form-control" id="passwd2" placeholder="비밀번호 확인">
            </div>
          </div>

          <hr class="my-4">	

          <button class="w-100 btn btn-primary btn-lg" id="join" type="submit">회원 가입</button>
        </form>
      </div>
    <div class="col"></div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2023 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  </body>
</html>


