# **BÁO CÁO**

# **Dự án phát triển ứng dụng di động**

# **Ứng dụng: Học Kanji**

![](RackMultipart20200925-4-a545qp_html_14e8ec1002630d73.png)

## **Nhóm số 33:
 - Hoàng Dương Hào - 18020460
 - Trần Quang Minh - 18020895

_Ứng dụng của nhóm mô phỏng và kế thừa dựa trên ứng dụng_ [_Học Kanji N4 N5_](https://play.google.com/store/apps/details?id=com.porolingo.kanji45) _trên Google Play Store. Nhà phát triển:_ **PORO NIHONGO** _._

#

# Research

**Ý tưởng:** Kanji là một bộ phận rất quan trọng và thú vị trong tiếng Nhật. Tuy nhiên, đây cũng chính là phần gây nhiều trở ngại cho những người mới học tiếng Nhật. Kanji bản chất là chữ Hán - loại chữ tượng hình gồm nhiều nét trong một kí tự, vì vậy để ghi nhớ và sử dụng thành thạo Kanji là điều khá khó khăn cho nhiều người, đặc biệt là ở những level entry. Ý tưởng để xây dựng ứng dụng Học Kanji là sẽ mang đến cho người học công cụ tốt nhất để học Kanji.

**Mục tiêu:** Ứng dụng tập trung vào việc sử dụng các bài tập, phương pháp như lấy ví dụ, học qua flashcards, thực hiện các bài test để luyện trí nhớ từ vựng.

**Phân tích người dùng:**

- Những người đang học tiếng Nhật để giao tiếp, đọc hiểu và thi lấy chứng chỉ JLPT.
- Người trẻ năng động, có sử dụng smartphone, sử dụng ứng dụng để có thể học mọi lúc mọi nơi.
- Những người quan tâm tới tiếng Nhật, mong muốn sang Nhật và thích tìm hiểu về Nhật Bản.

**Công nghệ và nền tảng phát triển:** Ứng dụng viết bằng thư viện Flutter, sử dụng ngôn ngữ Dart, dự kiến triển khai trên nền tảng Android, phân phối qua Google Play Store.

**Dự định sơ lược giao diện các màn hình và chức năng:**

### a. Dự định các màn hình:

1. Màn hình 1 - Trang chủ: Lựa chọn các level từ dễ đến khó.
2. Màn hình 2 - Danh sách Kanji: Hiện danh sách các bộ hán tự và chữ Kanji phù hợp với từng level.
3. Màn hình 3 - Kanji chi tiết: Học chi tiết theo các bộ Kanji.
4. Màn hình 4 - Flashcard: Học Kanji theo flashcard.
5. Màn hình 5 - Trắc nghiệm Kanji: Các bài test trắc nghiệm Kanji.

| ![](RackMultipart20200925-4-a545qp_html_dfd7a1549ba057ff.png)Màn hình 1: Trang chủ.
 | ![](RackMultipart20200925-4-a545qp_html_cf239375c69ee4e.png)Màn hình 2: Lựa chọn Kanji. |
| --- | --- |
| ![](RackMultipart20200925-4-a545qp_html_8c691d129d468f7d.png)Màn hình 3: Kanji chi tiết. | ![](RackMultipart20200925-4-a545qp_html_8854b4f1135a4d47.png)Màn hình 4: Flashcards. |

![](RackMultipart20200925-4-a545qp_html_9389a003ee6a4a7a.png)

Màn hình 5: Trắc nghiệm Kanji.

### b. Mô phỏng chức năng:

- Người dùng lựa chọn level theo khả năng phù hợp với năng lực của mình để học Kanji.
- Mỗi level sẽ có danh sách các chữ Kanji phù hợp với level lựa chọn.
- Người dùng có thể học chi tiết chữ Kanji gồm cách viết, âm kun, âm on,... Sau đó có thể học theo flashcard các chữ Kanji.
- Để kiểm tra năng lực có thể làm các bài quiz test trắc nghiệm về Kanji.

# Wireframing

# Technical Feasibility Assessment

# Prototype

### Thiết kế trên Figma: [https://bit.ly/2ZQTUrE](https://bit.ly/2ZQTUrE)

**Hình ảnh minh hoạ:**

![](RackMultipart20200925-4-a545qp_html_96333f5330d59ee9.png)

_Ảnh minh hoạ 1._

![](RackMultipart20200925-4-a545qp_html_50330e1c0c96af9c.png)

_Ảnh minh hoạ 2._

![](RackMultipart20200925-4-a545qp_html_7351fd636e65c3b1.png)

_Ảnh minh hoạ 3._

![](RackMultipart20200925-4-a545qp_html_dfba9944c9cc85b8.png)

_Ảnh minh hoạ 4._

#


#


# Design

### a. Thiết kế ca sử dụng:

![](RackMultipart20200925-4-a545qp_html_811231adbb72ed80.png)

### b. Thiết kế CSDL

- Cơ sở dữ liệu của ứng dụng được thiết kế bằng FRB (Firebase Realtime Database).
- Một số cấu trúc dữ liệu dự định:

- Dữ liệu kanji-detail:

![](RackMultipart20200925-4-a545qp_html_7459d752f89ea23c.png)

- Dữ liệu practise-test:

![](RackMultipart20200925-4-a545qp_html_9fce13464a1983f6.png)

- Dữ liệu level:

![](RackMultipart20200925-4-a545qp_html_cc10c4d50c3a0b85.png)

### c. Thiết kế API

# Develop

# Testing

# Deployment
