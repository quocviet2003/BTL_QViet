const loginForm = document.getElementById("login-form");
const notification = document.getElementById("notification");

loginForm.addEventListener("submit", function (event) {
    event.preventDefault();

    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    fetch("https://localhost:7172/api/User/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ username, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.token) {
            // Đăng nhập thành công, lưu token và chuyển hướng đến trang quản lý
            localStorage.setItem("token", data.token);
            console.log(data);
            window.location.href = "QuảnTrị.html";
        } else {
            // Đăng nhập thất bại, hiển thị thông báo lỗi
            showNotification("Tài khoản hoặc mật khẩu không đúng!", "error");
        }
    })
    .catch(error => {
        // Lỗi khi gọi API
        showNotification("Có lỗi xảy ra khi đăng nhập.", "error");
    });
});

function showNotification(message, type) {
    notification.textContent = message;
    notification.className = type;

    setTimeout(function () {
        notification.style.transform = "translateX(100%)";
        notification.style.opacity = "0";
        setTimeout(function () {
            notification.style.display = "none";
            notification.style.transform = "translateX(0)";
            notification.style.opacity = "1";
            notification.className = "";
        }, 300);
    }, 3000);

    notification.style.display = "block";
}




const passwordInput = document.getElementById("password");
  const showPasswordCheckbox = document.getElementById("showPassword");

  showPasswordCheckbox.addEventListener("change", function() {
    if (showPasswordCheckbox.checked) {
      passwordInput.type = "text"; // Hiện mật khẩu khi checkbox được chọn
    } else {
      passwordInput.type = "password"; // Ẩn mật khẩu khi checkbox không được chọn
    }
  });