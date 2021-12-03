<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Détails d'une vente</title>
	<%@ include file="fragment/DefaultHead.jspf"%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bid-details.css">
	
	<!-- JS UTILS -->
	<script src="<%=request.getContextPath()%>/js/ajax.js"></script>
	<script src="<%=request.getContextPath()%>/js/utils.js"></script>
</head>
<body>
	<%@include file="./fragment/Header.jspf" %>
	<h1 id="page-title"><c:choose>
		<c:when test="${mode} == 'won'">Vous avez remporté l'enchère</c:when>
		<c:when test="${mode} == 'ended'"><c:out value="${winner}" /> a remporté l'enchère</c:when>
		<c:otherwise>Détail vente</c:otherwise>
	</c:choose></h1>
	<div class="container">
		<img id="bid-image-viewer" src="">
		<form id="sell-form">
			<div class="input-container">
				<label for="bid-name">Article :</label>
				<p><c:out value="${article.name}" /></p>
			</div>
			<div class="input-container">
				<label for="bid-description">Description :</label>
				<p><c:out value="${article.description}" /></p>
			</div>
			<div class="input-container">
				<label for="bid-category">Catégorie :</label>
				<p>TO FIX</p>
			</div>
			<div class="input-container">
				<label for="bid-best-price">Meilleure offre :</label>
				<p><c:out value="${article.priceBuyer}" /></p>
			</div>
			<div class="input-container">
				<label for="bid-price">Mise à prix :</label>
				<p><c:out value="${article.priceSeller}" /></p>
			</div>
			<div class="input-container">
				<label for="bid-start-date">Début de l'enchère :</label>
				<p><c:out value="${article.dateStart}" /></p>
			</div>
			<div class="input-container">
				<label for="bid-end-date">Fin de l'enchère :</label>
				<p><c:out value="${article.dateEnd}" /></p>
			</div>
			<div class="input-container">
				<label for="bid-pickup">Retrait :</label>
				<p>TODO</p>
			</div>
			<div class="input-container">
				<label for="bid-seller">Vendeur :</label>
				<p><c:out value="${article.seller.pseudo}" /></p>
			</div>
			<c:choose>
				<c:when test="${mode} == 'won'">
					<div id="back" class="btn-accent">Retour</div>
				</c:when>
				<c:when test="${mode} == 'ended'">
					<div id="set-collected" class="btn-accent">Retrait effectué</div>
				</c:when>
				<c:otherwise>
					<div class="input-container">
						<label for="bid-offer">Ma proposition :</label>
						<input id="bid-offer" name="bid-offer" type="number" min="1" value="1" required>
						<div id="submit-offer" class="btn-accent">Enchérir</div>
					</div>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	<%@include file="./fragment/Footer.jspf" %>
	<script src="<%=request.getContextPath()%>/js/sell.js"></script>
</body>
</html>