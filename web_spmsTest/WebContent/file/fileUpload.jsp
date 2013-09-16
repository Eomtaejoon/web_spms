<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>

<%
    String uploadPath = request.getRealPath("upload");

    int size = 10 * 1024 * 1024;
    String name         = "";
    String fileName     = "";
    String origFileName = "";
    
    try{
        MultipartRequest multi = new MultipartRequest(request,
                uploadPath,size,"euc-kr",new DefaultFileRenamePolicy());  //COS���̺귯���� �����ϴ� ���ε� Ŭ�����̴�.
               //DefaultFileRenamePolicy()�޼���� �����̸��� �ߺ��ɰ�� test1�� ���� ���� �̸��� rename���ִ� ������ �Ѵ�.
        name = multi.getParameter("name");
        
        Enumeration files = multi.getFileNames();  //���۵� ���� Ÿ���� �Ķ���� �̸����� EnumerationŸ������ ��ȯ�Ѵ�.

        String file = (String)files.nextElement();
        fileName = multi.getFilesystemName(file);
        origFileName = multi.getOriginalFileName(file);
        
        System.out.println("name : " + name);
        System.out.println("fileName : " + fileName);
        System.out.println("origFileName : " + origFileName);
        
    }catch(Exception e){
        e.printStackTrace();
    }
%>
<html>
<body>
<form name="uploadCheck" action="uploadCheck.jsp" method="post">
    <input type="hidden" name="name" value="<%=name %>">
    <input type="hidden" name="filename" value="<%=fileName %>">
    <input type="hidden" name="origfilename" value="<%=origFileName %>">
</form>
<a href="#" onclick="javascript:uploadCheck.submit()">���ε� üũ �� �ٿ�ε� �������� �̵�</a>
</body>
</html>