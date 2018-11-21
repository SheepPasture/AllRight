<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- JQuery -->
<script src="/allRight/resources/js/jquery.min.js"
	type="text/javascript"></script>
<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>회원 가입</title>

<style>
.breadcrumbs_block h2 {
	margin-bottom: 15px;
	line-height: 80px;
	font-size: 80px;
	color: #000;
}

.breadcrumbs_block p {
	margin: 0;
	line-height: 34px;
	font-size: 26px;
	color: #999;
}

.breadcrumbs_block {
	padding: 50px 0;
}

.breadcrumbs_block {
	padding: 50px 0;
}

.breadcrumbs_block h2 {
	font-size: 60px;
	line-height: 64px;
}

.breadcrumbs_block p {
	font-size: 21px;
	line-height: 24px;
}

.breadcrumbs_block {
	padding: 40px 0;
}

.breadcrumbs_block h2 {
	font-size: 50px;
	line-height: 54px;
}

.breadcrumbs_block p {
	font-size: 16px;
	line-height: 20px;
}

.center {
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<%@ include file="/views/common/header.jsp"%>

	<!-- 회원가입 상단부 -->
	<section class="breadcrumbs_block clearfix parallax">
		<div class="container center">
			<h2>회원가입</h2>
			<p>AllRight은 무료로 사용이 가능합니다.</p>
		</div>
	</section>
	<!-- 회원가입 중단부  -->
	<article class="container">


		</div>

		<form class="form-horizontal"
			action="<%=request.getContextPath()%>/mInsert.me" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="userId">유저아이디</label>
				<div class="col-sm-6">
					<input class="form-control" name="inputId" id="inputId" type="text"
						placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" name="inputPassword" id="inputPassword"
						type="password" placeholder="비밀번호">
					<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="inputPasswordCheck" type="password"
						placeholder="비밀번호 확인">
					<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">이름</label>
				<div class="col-sm-6">
					<input class="form-control" name="inputName" id="inputName"
						type="text" placeholder="이름">
				</div>
			</div>




			<div class="form-group">
				<label class="col-sm-3 control-label" for="userId">이메일</label>
				<div class="col-sm-6">
					<input class="form-control" name="inputEmail" id="inputEmail"
						type="email" placeholder="이메일">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="userId">관심자격증</label>
				<div id="selectDiv">
				

					<script>
					
						$.ajax({
							url : '/allRight/lSelect.li',
							type : 'get',
							async : false,
							dataType : 'json',
							success : function(data) {
								console.log(data);
								console.log(data.list)

								selectOption(data);

							},
							error : function() {
								alert("실패");
							}
						});

						function selectOption(data) { /* selectOption 시작 */
							
							$('#selectDiv').append(
									'<select name="selectCategory" id="selectCategory">'
											+ '<option value="">선택하세요</option>'
											+'</select> <select name="licenseName" id="licenseName">'
											+ '<option value="">선택하세요</option>'
											+'</select><button id="add" type="button">추가</button><br>')
											.append(
													'<select name="selectCategory1" id="selectCategory1" style="display:none">'
													+ '<option value="">선택하세요</option>'
													+'</select> <select name="licenseName1" id="licenseName1" style="display:none>'
													+ '<option value="">선택하세요</option>'
													+'</select>');
							
						
							var list = data.lArray;
							var l = data.list;
							
							for (var i = 0; i < l.length; i++) {

								$('#selectCategory').append(
										"<option>" + l[i].listName
												+ "</option>");
							}
							
							$('#add').on('click', function() {
								$('#selectCategory1').removeAttr("style");
								$('#licenseName1').removeAttr("style");
							
								for (var i = 0; i < l.length; i++) {
									
									$('#selectCategory1').append(
											"<option>" + l[i].listName
													+ "</option>");

								}
							
							}); /* }); */

							$('#selectCategory').change(sCategory);
							function sCategory() {

								$('#licenseName').children().remove();
								for (var i = 0; i < list.length; i++) {

									var value = $('option:selected').val();
									console.log("1목록 : " + value);

									if (list[i].category == value) {
										$('#licenseName').append(
												"<option value="+list[i].lno+">"
														+ list[i].name
														+ "</option>");

									}

								}
							}
							
							
							$('#selectCategory1').change(sCategory1);
							function sCategory1() {
								
								$('#licenseName1').children().remove();
								for (var i = 0; i < list.length; i++) {

									var value = $('#selectCategory1 option:selected').val();
									console.log("2목록 :"+ value);

									if (list[i].category == value) {
										$('#licenseName1').append(
												"<option value="+list[i].lno+">"
														+ list[i].name
														+ "</option>");

									}

								}
							}

							$('#licenseName').change(lCategory);
							$('#licenseName1').change(lCategory1);
							function lCategory() {
								var value = $('#licenseName option:selected')
										.val();
								console.log("!값" +value);
							

							}
							function lCategory1() {
								var value = $('#licenseName1 option:selected').val();
								console.log("2값" +value);
						

					}

						}/*selectOption 끝  */
					</script>

				</div>
				<br>

				<div align="center">
					<script src="https://www.google.com/recaptcha/api.js?" async defer></script>
					<div class="g-recaptcha"
						data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
					<noscript>
						<div style="width: 302px; height: 352px;">
							<div style="width: 302px; height: 352px; position: relative;">
								<div style="width: 302px; height: 352px; position: absolute;">
									<iframe
										src="https://www.google.com/recaptcha/api/fallback?k=6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"
										frameborder="0" scrolling="no"
										style="width: 302px; height: 352px; border-style: none;">
									</iframe>
								</div>
								<div
									style="width: 250px; height: 80px; position: absolute; border-style: none; bottom: 21px; left: 25px; margin: 0px; padding: 0px; right: 25px;">
									<textarea id="g-recaptcha-response" name="g-recaptcha-response"
										class="g-recaptcha-response"
										style="width: 250px; height: 80px; border: 1px solid #c1c1c1; margin: 0px; padding: 0px; resize: none;">
        </textarea>
								</div>
					</noscript>
				</div>
				<br>
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<div align="center">
							<button class="btn btn-primary btn-block" type="submit"
								style="width: 300px;">AllRight 회원 가입</button>
						</div>
					</div>
		</form>
	</article>
	<script>
		/* var rexp
 */	
	
		function join() {
			$("#insertForm").submit();
		}

		$("#insertForm").submit(function(event) {
			if ($("#userPwd").val() == "" || $("#userId").val() == "")
				alert("아이디나 비밀번호는 필수 값입니다.");
			else if ($('#userPwd').val() != $('#userPwd2').val())
				alert("비밀번호 확인 값과 다릅니다.");
			else
				return;
			event.preventDefault();
		});
	</script>
</body>
</html>