<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>ALLRight</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />

	<style>

    /* 게시판관련 */
    .board_area { font-size:13px !important;  }

    .paging { text-align:center; padding:30px 0 0 0; }

    .btn_area2 { text-align:right; padding-top:20px; font-size:14px; font-weight:600;   }
    .btn_area2 a { display:inline-block; padding:7px 20px; background:#666; color:#fff; }


    table.view { width:100%; border-top:2px solid #000;    }
    table.view tbody tr th { background:#f4f4f4; border-bottom:1px solid #cfcfcf; border-right:1px solid #cfcfcf; padding:10px 0;   }
    table.view tbody tr td { background:#fff; border-bottom:1px solid #cfcfcf; padding:10px 20px; line-height:170%;   }
    table.view tbody tr td.board_contents { padding:20px 20px; }
    table.view tbody tr td img { width:100%; height:auto; }
    table.view tbody tr td.title { font-weight:600; }

	</style>

</head>
<body>
	<!-- PAGE -->
	<div id="page">
		<%@ include file="/views/common/header.jsp" %>
		<div class="container-fluid text-center">
			<div class="row content">
				<br />
				 <div class="col-sm-2 sidenav">
					<p>
						<a href="#">공지사항</a>
					</p>
					<p>
						<a href="#">커뮤니티</a>
					</p>
					<p>
						<a href="#">자격증정보</a>
					</p>
				</div> 
	
				<div class="col-sm-8 text-center">
					<h2 align="left">공지사항</h2>
					
					<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<table border="0" cellpadding="0" cellspacing="0" class="view">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>
							<tbody>
								<tr>
									<th>제목</th>
									<td colspan="3" class="title">공지사항 제목입니다.</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>작성자이름</td>
									<th>등록일시</th>
									<td>2018-11-07</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">없음</td>
								</tr>
								<tr>
									<th>내용</th>
										<td>
											<p>
												이것은 공지사항입니다.
											</p>
											<p>
												<span>이것은 공지사항입니다</span>
											</p>
											<p>
												<span>이것은 공지사항입니다</span>
											</p>
											<p>
												<span>이것은 공지사항입니다</span>
											</p>
										</td>
								</tr>					
								<tr>
									<td colspan="5"></td>
								</tr>
								
								<tr>
									<th>이전글&nbsp; ▲</th>
									<td colspan="3"><a href="">1번째 공지사항입니다.</a></td>
								</tr>
								<tr>
									<th>다음글&nbsp; ▼</th>
									<td colspan="3"><a href="">3번째 공지사항입니다.</a></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_area2">
							<a href="/allRight/selectList.ann">목록으로 바로가기</a>				
						</div>	
					</div>		
				</div>
			</div>
		</div>
	</div>
</body>

</html>
