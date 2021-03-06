function generateName(){
var ho =['An','Ánh','Ân','Âu','Ấu','Bá','Bạc','Bạch','Bàng','Bành','Bảo','Bế','Bì','Biện','Bình','Bồ','Ca','Cái','Cam','Cao','Cát','Cầm','Cấn','Chế','Chiêm','Chu','Chung','Chương','Chử','Cổ','Cù','Cung','Cự','Dã','Danh','Diêm','Doãn','Diệp','Đàm','Đan','Đào','Đậu','Điền','Đinh','Đoàn','Đôn','Đồng','Đổng','Đới','Đường','Giả','Giao','Giang','Giáp','Hà','Hạ','Hàn','Hán','Hy','Hình','Hoa','Hồng','Hùng','Hứa','Kha','Khương','Khâu','Khoa','Khổng','Khu','Khuất','Khúc','Kiều','Kim','La','Lạc','Lại','Lâm','Lều','Liễu','Lò','Lục','Lư','Lã','Lương','Lưu','Ma','Mã','Mạc','Mạch','Mai','Mang','Mâu','Mẫn','Mộc','Ninh','Nhâm','Ngân','Nghiêm','Nghị','Ngụy','Nhữ','Nông','Ong','Ông','Phi','Phí','Phó','Phùng','Phương','Quản','Quách','Sầm','Sơn','Sử','Tạ','Tào','Tăng','Thạch','Thái','Thành','Thào','Thân','Thập','Thi','Thiều','Thịnh','Thôi','Tiêu','Tiếp','Tòng','Tô','Tôn','Tông','Tống','Trang','Trà','Trác','Triệu','Trịnh','Trình','Trưng','Trương','Từ','Ty','Uông','Văn','Vi','Viên','Vương','Xa','Yên','Ngọc','Liêu','Lỗ'];

var ten = ['Mỹ','Duệ','Tăng','Cường','Tráng','Liên','Huy','Phát','Bội','Hương','Linh','Nghi','Hàm','Tốn','Thuận','Vĩ','Vọng','Biểu','Khôn','Quang','Lương','Kiến','Ninh','Hòa','Thuật','Du','Hành','Suất','Nghĩa','Phương','Dưỡng','Di','Tương','Thực','Hảo','Cao','Túc','Thể','Vi','Tường','Tịnh','Hoài','Chiêm','Viễn','Ái','Cảnh','Ngưỡng','Mậu','Thanh','Kha','Nghiễm','Khác','Do','Trung','Ðạt','Liên','Trung','Tập','Cát','Ða','Diên','Hội','Phong','Hanh','Hiệp','Trùng','Phùng','Tuấn','Lãng','Nghi','Hậu','Lưu','Thành','Tú','Diệu','Diễn','Khánh','Thích','Phương','Huy','Từ','Thể','Dương','Quỳnh','Cẩm','Phu','Văn','Ái','Diệu','Dương','Bách','Chi','Quân','Phụ','Dực','Vạn','Diệp','Hiệu','Khuông','Tương'];
return ho[Math.floor(Math.random()*100) % ho.length] + ' ' + ten[Math.floor(Math.random()*100) % ten.length]
}


function randomNumber(a,b)
{
	if(b == undefined) {
		b = a - 1;
		a = 0;
	}
	var delta = b - a + 1;
	return Math.floor(Math.random()*delta) + a
}

function generatePerson(n)
{
	var languages = ["vn", "en", "jp", "kr"];
	var countries = ["Vietname", "France", "Japan"];

	var genders = ["male", "female", "third"];
	var persons = [];
	for (var i = 0; i < n ; i++)
	{
		console.log(i);
		var person = {
			name: generateName(),
			age: randomNumber(15,60),
			iq: randomNumber(120,170),
			height: randomNumber(120,210),
			gender: genders[randomNumber(genders.length)],
			type: "person",
			language: languages[randomNumber( languages.length)],
			country: countries[randomNumber( countries.length)]
		};

		persons.push(person);

	}
	return persons;

}
