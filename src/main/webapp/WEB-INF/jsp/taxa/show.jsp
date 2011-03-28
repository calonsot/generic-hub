<%-- 
    Document   : collection
    Created on : Feb 22, 2011, 11:49:55 AM
    Author     : "Nick dos Remedios <Nick.dosRemedios@csiro.au>"
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<c:set var="hostName" value="${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OzCam Hub - Taxa Page: </title>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty taxon}">
                <div id="headingBar" class="fullWidthHeader">
                    <h1>${taxon.rank}: <span id="taxonName"><alatag:formatSciName rankId="${taxon.rankId}" name="${taxon.scientificName}"/> ${taxon.author}</span></h1>
                    <h2>${taxon.allCommonNames}</h2>
                </div>
                <div id="SidebarBox">
                    <div class="sidebar">
<!--                        <div style="width: 220px;">-->
                            <c:forEach var="image" items="${taxon.images}">
                                <div class="imageThumb">
                                    <a href="${image.identifier}"><img src="${image.thumbnail}" alt="${image.title}"/></a>
                                </div>
                            </c:forEach>
<!--                        </div>-->
                    </div>
                </div><!-- end div#SidebarBox --> 
                <div id="content">
                    <c:if test="${not empty taxon.description}">
                        <h3>Description</h3>
                        <div class="taxaDescription">${taxon.description}</div>
                    </c:if>
                    <c:if test="${not empty taxon.classification}">
                        <h3>Classification</h3>
                        <div class="taxaDescription">${taxon.classification}</div>
                    </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <h2>Not Found</h2>
                <div>The requested taxon page "${guid}" could not be found.</div>
            </c:otherwise>
        </c:choose>
    </body>
</html>
