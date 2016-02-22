function generateName(){
var ho =['An','Ánh','Ân','Âu','Ấu','Bá','Bạc','Bạch','Bàng','Bành','Bảo','Bế','Bì','Biện','Bình','Bồ','Ca','Cái','Cam','Cao','Cát','Cầm','Cấn','Chế','Chiêm','Chu','Chung','Chương','Chử','Cổ','Cù','Cung','Cự','Dã','Danh','Diêm','Doãn','Diệp','Đàm','Đan','Đào','Đậu','Điền','Đinh','Đoàn','Đôn','Đồng','Đổng','Đới','Đường','Giả','Giao','Giang','Giáp','Hà','Hạ','Hàn','Hán','Hy','Hình','Hoa','Hồng','Hùng','Hứa','Kha','Khương','Khâu','Khoa','Khổng','Khu','Khuất','Khúc','Kiều','Kim','La','Lạc','Lại','Lâm','Lều','Liễu','Lò','Lục','Lư','Lã','Lương','Lưu','Ma','Mã','Mạc','Mạch','Mai','Mang','Mâu','Mẫn','Mộc','Ninh','Nhâm','Ngân','Nghiêm','Nghị','Ngụy','Nhữ','Nông','Ong','Ông','Phi','Phí','Phó','Phùng','Phương','Quản','Quách','Sầm','Sơn','Sử','Tạ','Tào','Tăng','Thạch','Thái','Thành','Thào','Thân','Thập','Thi','Thiều','Thịnh','Thôi','Tiêu','Tiếp','Tòng','Tô','Tôn','Tông','Tống','Trang','Trà','Trác','Triệu','Trịnh','Trình','Trưng','Trương','Từ','Ty','Uông','Văn','Vi','Viên','Vương','Xa','Yên','Ngọc','Liêu','Lỗ'];

var ten = ['Mỹ','Duệ','Tăng','Cường','Tráng','Liên','Huy','Phát','Bội','Hương','Linh','Nghi','Hàm','Tốn','Thuận','Vĩ','Vọng','Biểu','Khôn','Quang','Lương','Kiến','Ninh','Hòa','Thuật','Du','Hành','Suất','Nghĩa','Phương','Dưỡng','Di','Tương','Thực','Hảo','Cao','Túc','Thể','Vi','Tường','Tịnh','Hoài','Chiêm','Viễn','Ái','Cảnh','Ngưỡng','Mậu','Thanh','Kha','Nghiễm','Khác','Do','Trung','Ðạt','Liên','Trung','Tập','Cát','Ða','Diên','Hội','Phong','Hanh','Hiệp','Trùng','Phùng','Tuấn','Lãng','Nghi','Hậu','Lưu','Thành','Tú','Diệu','Diễn','Khánh','Thích','Phương','Huy','Từ','Thể','Dương','Quỳnh','Cẩm','Phu','Văn','Ái','Diệu','Dương','Bách','Chi','Quân','Phụ','Dực','Vạn','Diệp','Hiệu','Khuông','Tương'];
return ho[Math.floor(Math.random()*100) % ho.length] + ' ' + ten[Math.floor(Math.random()*100) % ten.length]
}

function createBuf(dbname, n)
{
	var languages = ["vn", "en", "jp", "kr"];
	var countries = ["Vietname", "France", "Japan"];

	var genders = ["male", "female", "third"];

	var c = 0;
	var u = 0;
	function justDo(){
		u++;
		if(u < n)
		{
			setTimeout(justDo)
		}

		var person = {
			name: generateName(),
			age: Math.floor(Math.random()*1000) % 50 + 15,
			iq: Math.floor(Math.random()* 1000) % 120 + 50,
			height: Math.floor(Math.random()* 1000) % 90 + 120,
			gender: genders[Math.floor(Math.random()*1000) % genders.length],
			type: "person",
			language: languages[Math.floor(Math.random()*1000) % languages.length],
			country: countries[Math.floor(Math.random()*1000) % countries.length]

		};
		$.get('/_uuids',function(data){
				uuid = JSON.parse(data).uuids[0];
				$.ajax({url:'/' + dbname + '/' + uuid, type:"PUT", data:JSON.stringify( person), success: function()
				{
					c++;
					console.log(c + '/' + n + " (" + Math.floor(c/n* 100) + "%)");
					delete person;
				}
			});
		})
	};

	justDo();
	
}