<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.js-open-target, .js-close-target {
	cursor: pointer;
}
</style>

<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="main.do">Main</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">Shop</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section">
	<div class="container">

		<div class="row mb-5">
			<div class="col-md-9 order-2">

				<div class="row">
					<div class="col-md-12 mb-5">
						<div class="float-md-left mb-4">
							<h2 class="text-black h5">상품 목록</h2>
						</div>
					</div>
				</div>
				<div class="row mb-5">
					<c:forEach var="product" items="${list}">
						<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
							<div class="block-4 text-center border">
								<figure class="block-4-image">
									<a
										href="getProd.do?&page=${pageInfo.pageNum}&pid=${product.pdtId}"><img
										src="images/${product.pdtImg}" alt="Image placeholder"
										class="img-fluid"></a>
								</figure>
								<div class="block-4-text p-4">
									<h3>
										<a
											href="getProd.do?&page=${pageInfo.pageNum}&pid=${product.pdtId}">${product.pdtNm}</a>
									</h3>
									<p class="mb-0">${product.brdNm}</p>
									<p class="text-primary font-weight-bold">${product.pdtPrice}</p>
									<p>${product.pdtViews}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<c:if test="${userinfo.userGrade == '관리자'}">
						<button class="btn btn-primary me-md-2" type="button"
							onclick="location.href='prodAddForm.do'">게시글 등록</button>
					</c:if>
				</div>
				<div class="row" data-aos="fade-up">
					<div class="col-md-12 text-center">
						<div class="site-block-27">
							<ul>
								<li><c:if test="${pageInfo.prev}">
										<a href="prodList.do?page=${pageInfo.startPage-1}">&lt;</a>
									</c:if></li>
								<c:forEach var="i" begin="${pageInfo.startPage}"
									end="${pageInfo.endPage}">
									<li class="${i == pageInfo.pageNum ? 'active' : ''}"><a
										href="prodList.do?page=${i}">${i}</a></li>
								</c:forEach>
								<li><c:if test="${pageInfo.next}">
										<a href="prodList.do?page=${pageInfo.endPage+1}">&gt;</a>
									</c:if></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-3 order-1 mb-5 mb-md-0">
				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="cat" data-target=".closed-content1"
								onclick="categories()">카테고리</a>
						</h3>
						<div class="closed-content1" style="display:none;">
							<c:forEach var="i" begin="0" end="${fn:length(catlist)-1}">
								<label for="${catlist[i].catId}" class="d-flex"> <input
									type="checkbox" id="${catlist[i].catId}" class="mr-2 mt-1">
									<span class="text-black">${catlist[i].catNm}</span> <span
									class="text-black ml-auto">(${cntarr[i]})</span>
								</label>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="subcat"
								data-target=".closed-content2" onclick="subcategory()">세부카테고리</a>
						</h3>
						<div class="closed-content2" style="display:none;">
							<c:forEach var="i" begin="0" end="${fn:length(subcatlist)-1}">
								<label for="${subcatlist[i].subcatId}" class="d-flex"> <input
									type="checkbox" id="${subcatlist[i].subcatId}"
									class="mr-2 mt-1"> <span class="text-black">${subcatlist[i].subcatNm}</span>
									<span class="text-black ml-auto">(${subcntarr[i]})</span>
								</label>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="gender"
								data-target=".closed-content3" onclick="gender()">성별</a>
						</h3>
						<div class="closed-content3" style="display:none;">
							<c:forEach var="i" begin="0" end="${fn:length(genderlist)-1}">
								<label for="${genderlist[i].genderId}" class="d-flex"> <input
									type="checkbox" id="${genderlist[i].genderId}"
									class="mr-2 mt-1"> <span class="text-black">${genderlist[i].genderNm}</span>
									<span class="text-black ml-auto">(${genderarr[i]})</span>
								</label>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="brand"
								data-target=".closed-content4" onclick="brand()">브랜드</a>
						</h3>
						<div class="closed-content4" style="display:none;">
							<c:forEach var="i" begin="0" end="${fn:length(brdlist)-1}">
								<label for="${brdlist[i].brdId}" class="d-flex"> <input
									type="checkbox" id="${brdlist[i].brdId}" class="mr-2 mt-1">
									<span class="text-black">${brdlist[i].brdNm}</span> <span
									class="text-black ml-auto">(${brdarr[i]})</span>
								</label>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="border p-4 rounded mb-4">
					<div class="mb-4">
						<h3 class="mb-3 h6 text-uppercase text-black d-block"
							class="jquery-on-container">
							<a class="js-open-target" id="size"
								data-target=".closed-content5" onclick="size()">사이즈</a>
						</h3>
						<div class="closed-content5" style="display:none;">
							<label for="s_sm" class="d-flex"> <input type="checkbox"
								id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small</span>
								<span class="text-black ml-auto">(2,319)</span>
							</label> <label for="s_md" class="d-flex"> <input type="checkbox"
								id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium</span>
								<span class="text-black ml-auto">(1,282)</span>
							</label> <label for="s_lg" class="d-flex"> <input type="checkbox"
								id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large</span>
								<span class="text-black ml-auto">(1,392)</span>
							</label>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	function categories() {
		$('#cat').each(function() {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}

	function subcategory() {
		$('#subcat').each(function() {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}

	function gender() {
		$('#gender').each(function() {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}

	function brand() {
		$('#brand').each(function() {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}

	function size() {
		$('#size').each(function() {
			var target_selector = $(this).data('target');
			console.log(target_selector);
			$(target_selector).toggle();
		});
	}
</script>