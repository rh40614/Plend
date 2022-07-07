<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="229501873706-7g1g5tqh1jeitmnhmnkft67koof6th6e.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>
  </head>
  <body>
  
    <div id="g_id_onload"
     data-client_id="229501873706-7g1g5tqh1jeitmnhmnkft67koof6th6e.apps.googleusercontent.com"
     data-login_uri="http://localhost:8090/controller/common/googleloginGo.do"
     data-auto_prompt="false"></div>
  <div class="g_id_signin" data-type="standard" data-size="large"
     data-theme="outline" data-text="sign_in_with" data-shape="rectangular"
     data-logo_alignment="left">
  </div>
    <script>
    function handleCredentialResponse(response) {
        const responsePayload = parseJwt(response.credential);
        
        var email = responsePayload.email;
        var name = responsePayload.name;
        var accessToken = response.credential;
        console.log(email);
   		console.log(name);
   		console.log(accessToken);
          
          //location.href="google.do?name="+responsePayload.name+"&email="+responsePayload.email+"&accessToken="+response.credential;
     }
     function parseJwt(token){
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g,'/');
        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c){
           return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        return JSON.parse(jsonPayload);
     };
     window.onload = function() {
        google.accounts.id.initialize({
           client_id : "229501873706-7g1g5tqh1jeitmnhmnkft67koof6th6e.apps.googleusercontent.com",
           login_uri :"http://localhost:8090/controller/common/googleloginGo.do"
        });
        google.accounts.id.renderButton(document
              .getElementById("buttonDiv"), {
           theme : "outline",
           size : "large"
        } // customization attributes
        );
        google.accounts.id.prompt(); // also display the One Tap dialog
     }
    
     
    </script>
<a href = "#" onclick="signout();" class = "signout_button">Sign Out</a>

<script>

function signout(){
    const button = document.getElementById('signout_button');
    button.onclick=()=> {
      google.accounts.id.disableAutoSelect();
    }
    }
    
</script>

  </body>
</html>