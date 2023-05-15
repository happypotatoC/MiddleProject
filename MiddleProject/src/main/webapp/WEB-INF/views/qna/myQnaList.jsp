<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="site-section">
<c:set var = "no" value="0"></c:set>
<div class= container>
    			<div class="col-md-3">
				<div class="sidebar">
					<a href="mypageView.do">내 정보 보기</a> <a href="wishList.do">관심상품</a>
					<a href="sellListU.do">판매내역</a> <a href="buyListU.do">구매내역</a> <a
						href="myQna.do">나의 Q&A</a> <a href="noteList.do">받은 쪽지함</a> <a
						href="myReview.do">나의 리뷰</a>
					<c:if test="${userinfo.userGrade == '관리자'}">
						<a href="sendNote.do">쪽지보내기</a>
					</c:if>
				</div>
			</div>
<h3>MY&nbsp&nbspQ&A리스트</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col" class ="text-primary" >No.</th>
      <th scope="col" class ="text-primary">제목</th>
      <th scope="col" class ="text-primary">작성자</th>
      <th scope="col" class ="text-primary">DATE</th>
    </tr>
  </thead>
  <c:forEach var="i" items="${myQna}">
    <tr>
		<td><c:out value="${i.postId }"></c:out></td>
		<td><a href="getQna.do?page=${pageInfo.pageNum}&postId=${i.postId }">${i.postTitle } </a></td>
		<td>${userinfo.userNm }</td>
		<td>${i.postDate }</td>
    </tr>
   </c:forEach>
</table>


<div class="center">
    <div class="pagination justify-content-center">
		<c:if test="${pageInfo.prev }">
			<a  class="page-link" href="myQna.do?page=${pageInfo.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<a  class="page-link" class="${i == pageInfo.pageNum ? 'active' : '' }" href="myQna.do?page=${i }">${i } </a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a  class="page-link" href="myQna.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
</div>
</div>
</div>

  