# 🏦 Banking Application - Full Stack

Ứng dụng quản lý ngân hàng full-stack với Spring Boot backend và React frontend.

## 🎯 Tính Năng

- ✅ Quản lý khách hàng (CRUD)
- ✅ Mở tài khoản Tiết kiệm và Thanh toán
- ✅ Nạp tiền / Rút tiền
- ✅ Chuyển khoản giữa các tài khoản
- ✅ Xem lịch sử giao dịch
- ✅ REST API đầy đủ
- ✅ Giao diện web hiện đại với React

## 🛠️ Tech Stack

### Backend
- **Java 17+**
- **Spring Boot 3.2.0**
- **Spring Data JPA**
- **H2 Database** (development) / **MySQL** (production)
- **Lombok**
- **Swagger/OpenAPI** (API documentation)

### Frontend
- **React 18**
- **React Router**
- **Axios**
- **CSS3**

## 📋 Yêu Cầu Hệ Thống

### Backend
- Java JDK 17 hoặc cao hơn
- Maven 3.6+ (hoặc có thể dùng Maven wrapper đi kèm)
- MySQL 8.0+ (nếu muốn dùng production database)

### Frontend
- Node.js 18+
- npm hoặc yarn

## 🚀 Hướng Dẫn Cài Đặt

### 1. Cài Đặt Maven (nếu chưa có)

**Windows:**
```powershell
# Tải Maven từ: https://maven.apache.org/download.cgi
# Giải nén và thêm vào PATH

# Hoặc dùng Chocolatey:
choco install maven
```

Kiểm tra cài đặt:
```bash
mvn -version
```

### 2. Cài Đặt Node.js (nếu chưa có)

**Windows:**
- Tải từ: https://nodejs.org/
- Chọn phiên bản LTS
- Cài đặt và kiểm tra:

```powershell
node --version
npm --version
```

### 3. Cài Đặt MySQL (Optional - cho production)

- Tải XAMPP: https://www.apachefriends.org/
- Hoặc MySQL Workbench: https://dev.mysql.com/downloads/workbench/

Tạo database:
```sql
CREATE DATABASE banking_app;
```

## 🏃 Chạy Ứng Dụng

### Backend (Spring Boot)

1. Di chuyển vào thư mục backend:
```bash
cd e:\bt_kthp_java\backend
```

2. Build project:
```bash
mvn clean install
```

3. Chạy ứng dụng:
```bash
mvn spring-boot:run
```

Hoặc chạy trực tiếp file JAR:
```bash
java -jar target/banking-app-1.0.0.jar
```

Backend sẽ chạy tại: **http://localhost:8080**

**Các URL quan trọng:**
- API Endpoints: `http://localhost:8080/api/...`
- Swagger UI: `http://localhost:8080/swagger-ui.html`
- H2 Console: `http://localhost:8080/h2-console` (chỉ khi dùng H2)

### Frontend (React)

1. Di chuyển vào thư mục frontend:
```bash
cd e:\bt_kthp_java\frontend
```

2. Cài đặt dependencies:
```bash
npm install
```

3. Chạy development server:
```bash
npm run dev
```

Frontend sẽ chạy tại: **http://localhost:5173**

## 📡 API Endpoints

### Customers
- `POST /api/customers` - Tạo khách hàng mới
- `GET /api/customers` - Lấy danh sách khách hàng
- `GET /api/customers/{customerId}` - Lấy thông tin khách hàng
- `PUT /api/customers/{customerId}` - Cập nhật khách hàng
- `DELETE /api/customers/{customerId}` - Xóa khách hàng

### Accounts
- `POST /api/accounts` - Mở tài khoản mới
- `GET /api/accounts` - Lấy danh sách tài khoản
- `GET /api/accounts/{accountNumber}` - Lấy thông tin tài khoản
- `POST /api/accounts/deposit` - Nạp tiền
- `POST /api/accounts/withdraw` - Rút tiền
- `POST /api/accounts/transfer` - Chuyển khoản
- `GET /api/accounts/{accountNumber}/balance` - Kiểm tra số dư

### Transactions
- `GET /api/transactions/{accountNumber}` - Lịch sử giao dịch
- `GET /api/transactions/{accountNumber}/recent?limit=10` - Giao dịch gần đây

## 🔧 Cấu Hình Database

### Dùng H2 (Mặc định - In-Memory)
Không cần cấu hình gì thêm. Data sẽ mất khi tắt ứng dụng.

### Chuyển sang MySQL

Mở file `backend/src/main/resources/application.properties` và chỉnh sửa:

```properties
# Comment out H2 configuration
# spring.datasource.url=jdbc:h2:mem:bankingdb
# ...

# Uncomment MySQL configuration
spring.datasource.url=jdbc:mysql://localhost:3306/banking_app?useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.database-platform=org.hibernate.dialect.MySQLDialect
```

## 📚 Cấu Trúc Project

```
bt_kthp_java/
├── backend/                    # Spring Boot Application
│   ├── src/main/java/com/banking/
│   │   ├── entity/            # JPA Entities
│   │   ├── repository/        # Data Access Layer
│   │   ├── service/           # Business Logic
│   │   ├── controller/        # REST Controllers
│   │   ├── dto/               # Data Transfer Objects
│   │   └── config/            # Configuration
│   └── pom.xml
├── frontend/                   # React Application
│   ├── src/
│   │   ├── components/        # React Components
│   │   ├── pages/             # Page Components
│   │   ├── services/          # API Services
│   │   └── App.jsx
│   └── package.json
└── README.md
```

## 🧪 Testing

### Test Backend APIs với Swagger UI
1. Mở trình duyệt: `http://localhost:8080/swagger-ui.html`
2. Chọn endpoint muốn test
3. Click "Try it out" và nhập dữ liệu
4. Click "Execute"

### Test với cURL

Tạo khách hàng:
```bash
curl -X POST http://localhost:8080/api/customers \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"Nguyen Van A\",\"phone\":\"0123456789\"}"
```

Mở tài khoản:
```bash
curl -X POST http://localhost:8080/api/accounts \
  -H "Content-Type: application/json" \
  -d "{\"customerId\":\"C0001\",\"accountType\":\"SAVINGS\",\"initialBalance\":100000}"
```

## 🐛 Troubleshooting

### Backend không chạy được
- Kiểm tra Java version: `java -version` (cần >= 17)
- Kiểm tra port 8080 có bị chiếm không
- Xem logs trong terminal

### Frontend không chạy được
- Xóa `node_modules` và chạy lại `npm install`
- Kiểm tra port 5173 có free không
- Kiểm tra backend đã chạy chưa

### Lỗi kết nối MySQL
- Kiểm tra MySQL service đã chạy chưa
- Kiểm tra username/password trong `application.properties`
- Đảm bảo database `banking_app` đã được tạo

## 📝 License

MIT License

## 👨‍💻 Author

Dự án bài tập Kết thúc học phần Java OOP
