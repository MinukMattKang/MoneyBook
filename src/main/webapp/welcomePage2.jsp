<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>


<script>

function whatisme(n, x) {
    let blabla = '';
    n = n.toString();
    if (n.length < x) {
        for (int i =0; i < x- n.length; i++)
        blabla += '0'
    }
    return blabla + n;
    console.log(blabla + n);
}

</script>




<title>Welcome Page</title>
</head>
<body>

		<button onclick="whatisme('안녕', 5)">안녕</button>
</body>
</html>