use adc

CREATE TABLE KhachHang (
    MaKH char(10) PRIMARY KEY ,
    TenKH NVARCHAR(50),
    DiaChi NVARCHAR(250) null,
    SDT NVARCHAR(15) null,
    
);
drop table KhachHang



CREATE TABLE [dbo].[ChiTietHoaDons](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[TongGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetailBill] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



CREATE TABLE [dbo].[HoaDons](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
	[NgayDuyet] [datetime] NULL,
	[TongGia] [decimal](18, 0) NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
	[Diachi] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DiaChiGiaoHang] [nvarchar](350) NULL,
	[ThoiGianGiaoHang] [datetime] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[SanPhams](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](150) NULL,
	[AnhDaiDien] [nvarchar](350) NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaGiam] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [bit] NULL,
	[LuotXem] [int] NULL,
	[DacBiet] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[ChiTietTaiKhoans](
	[MaChitietTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
 CONSTRAINT [PK_InformationAccounts] PRIMARY KEY CLUSTERED 
(
	[MaChitietTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[LoaiTaiKhoans](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[MoTa] [nvarchar](250) NULL,
 CONSTRAINT [PK_TypeAccounts] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TaiKhoans](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[LoaiTaiKhoan] [int] NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



-- Chèn một bản ghi vào bảng "LoaiTaiKhoans"
INSERT INTO [dbo].[LoaiTaiKhoans] ([TenLoai], [MoTa])
VALUES ('admin', 'Cho người quản lý');
INSERT INTO [dbo].[LoaiTaiKhoans] ([TenLoai], [MoTa])
VALUES ('user', 'Cho khách');


-- Chèn một bản ghi vào bảng "TaiKhoans"
INSERT INTO [dbo].[TaiKhoans] ([LoaiTaiKhoan], [TenTaiKhoan], [MatKhau], [Email])
VALUES (1, 'ad1', '1', 'admin@gmail.com');
INSERT INTO [dbo].[TaiKhoans] ([LoaiTaiKhoan], [TenTaiKhoan], [MatKhau], [Email])
VALUES (2, 'us1', '1', 'user@gmail.com');




INSERT INTO [dbo].[ChiTietHoaDons] (
    [MaHoaDon],
    [MaSanPham],
    [SoLuong],
    [TongGia]
) VALUES (
    2, -- Mã hóa đơn
    101, -- Mã sản phẩm
    2, -- Số lượng
    300000 -- Tổng giá
);


-- Chèn một hóa đơn mới vào bảng HoaDons
INSERT INTO [dbo].[HoaDons] (
    [TrangThai],
    [NgayTao],
    [NgayDuyet],
    [TongGia],
    [TenKH],
    [GioiTinh],
    [Diachi],
    [Email],
    [SDT],
    [DiaChiGiaoHang],
    [ThoiGianGiaoHang]
) VALUES (
    1, 
    '2023-09-19 10:00:00', 
    '2023-09-19 11:00:00', 
    1500000, -- Tổng giá
    N'Nguyễn Văn A', -- Tên khách hàng
    1, -- Giới tính (1 cho nam, 0 cho nữ)
    N'Hưng Yên', -- Địa chỉ
    'nguyenvana@email.com', -- Email
    '1234567890', -- Số điện thoại
    N'Hà Nội', -- Địa chỉ giao hàng
    '2023-09-19 14:00:00' -- Thời gian giao hàng
);



INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT)
VALUES ('1', N'Nguyễn Quốc Việt', N'Hưng Yên', '0123456789');
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT)
VALUES ('3', N'Việt', N'Hà Nội', '0123456789');

select * from KhachHang

drop proc KH_get_by_id

CREATE PROCEDURE KH_get_by_id
    @MaID char(10)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(MAX);

    -- Kiểm tra xem @MaID có tồn tại trong bảng KhachHang không
    IF NOT EXISTS (SELECT 1 FROM KhachHang WHERE MaKH = @MaID)
    BEGIN
        SET @ErrorMessage = 'Không tìm thấy khách hàng với MaKH = ' + @MaID;
        
        RETURN;
    END;

    -- Lấy thông tin của khách hàng dựa trên @MaID
    SELECT * FROM KhachHang WHERE MaKH = @MaID;
END;


CREATE PROCEDURE create_khach_hang
    @MaKH char(10),
    @TenKH NVARCHAR(50),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(15)
AS
BEGIN
    

    -- Thêm dữ liệu mới vào bảng KhachHang
    INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT)
    VALUES (@MaKH, @TenKH, @DiaChi, @SDT);
    

END;




CREATE PROCEDURE sp_khach_update
    @MaKH char(10),
    @TenKH NVARCHAR(50),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(15)
AS
BEGIN
    UPDATE KhachHang
    SET 
        TenKH = @TenKH,
        DiaChi = @DiaChi,
        SDT = @SDT
    WHERE
        MaKH = @MaKH;
END;


CREATE PROCEDURE sp_khach_delete
    @MaKH char(10)
AS
BEGIN
    DELETE FROM KhachHang
    WHERE MaKH = @MaKH;
END;




create PROCEDURE sp_khach_search (@page_index  INT, 
                                       @page_size   INT,
									   @ten_khach Nvarchar(50),
									   @dia_chi Nvarchar(100)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.MaKH,
							  k.TenKH,
							  k.DiaChi
                        INTO #Results1
                        FROM KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.MaKH,
							  k.TenKH,
							  k.DiaChi
                        INTO #Results2
                        FROM KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
        END;
    END;




CREATE PROCEDURE KH_get_all
AS
BEGIN
    SELECT * FROM KhachHang;
END;



drop proc sp_hoa_don_update

create PROCEDURE [dbo].[sp_hoa_don_update]
(@MaHoaDon        int, 
 @TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @TrangThai         bit,  
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE HoaDons
		SET
			TenKH  = @TenKH ,
			Diachi = @Diachi,
			TrangThai = @TrangThai
		WHERE MaHoaDon = @MaHoaDon;
		
		IF(@list_json_chitiethoadon IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDon,
			  JSON_VALUE(p.value, '$.maHoaDon') as maHoaDon,
			  JSON_VALUE(p.value, '$.maSanPham') as maSanPham,
			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
			  JSON_VALUE(p.value, '$.tongGia') as tongGia,
			  JSON_VALUE(p.value, '$.status') AS status 
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitiethoadon) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO ChiTietHoaDons (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia ) 
			   SELECT
				  #Results.maSanPham,
				  @MaHoaDon,
				  #Results.soLuong,
				  #Results.tongGia			 
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE ChiTietHoaDons 
			  SET
				 SoLuong = #Results.soLuong,
				 TongGia = #Results.tongGia
			  FROM #Results 
			  WHERE  ChiTietHoaDons.maChiTietHoaDon = #Results.maChiTietHoaDon AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM ChiTietHoaDons C
			INNER JOIN #Results R
				ON C.maChiTietHoaDon=R.maChiTietHoaDon
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;



alter PROCEDURE [dbo].[sp_hoadon_create]
(@TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaHoaDon INT;
        INSERT INTO HoaDons
                (TenKH, 
                 Diachi           
                )
                VALUES
                (@TenKH, 
                 @Diachi
                );

				SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitiethoadon IS NOT NULL)
                    BEGIN
                        INSERT INTO ChiTietHoaDons
						 (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia               
                        )
                    SELECT JSON_VALUE(p.value, '$.maSanPham'), 
                            @MaHoaDon, 
                            JSON_VALUE(p.value, '$.soLuong'), 
                            JSON_VALUE(p.value, '$.tongGia')    
                    FROM OPENJSON(@list_json_chitiethoadon) AS p;
                END;
        SELECT '';
    END;


alter table HoaDons
alter column GioiTinh bit null


create PROCEDURE [dbo].[sp_thong_ke_khach] (@page_index  INT, 
                                       @page_size   INT,
									   @ten_khach Nvarchar(50),
									   @fr_NgayTao datetime, 
									   @to_NgayTao datetime
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.TongGia,
							  h.NgayTao,
							  h.TenKH,
							  h.Diachi
                        INTO #Results1
                        FROM HoaDons  h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
                            AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))              
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.TongGia,
							  h.NgayTao,
							  h.TenKH,
							  h.Diachi
                        INTO #Results2
                        FROM HoaDons  h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
                            AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))
SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2                        
                        DROP TABLE #Results2; 
        END;
    END;





CREATE PROCEDURE HD_get_all
AS
BEGIN
    SELECT * FROM HoaDons;
END;



create PROCEDURE [dbo].[sp_hoadon_get_by_id](@MaHoaDon int)
AS
    BEGIN
        SELECT h.*, 
        (
            SELECT c.*
            FROM ChiTietHoaDons AS c
            WHERE h.MaHoaDon = c.MaHoaDon FOR JSON PATH
        ) AS list_json_chitiethoadon
        FROM HoaDons AS h
        WHERE  h.MaHoaDon = @MaHoaDon;
    END;



create PROCEDURE [dbo].[sp_login](@taikhoan nvarchar(50), @matkhau nvarchar(50))
AS
    BEGIN
      SELECT  *
      FROM TaiKhoans
      where TenTaiKhoan= @taikhoan and MatKhau = @matkhau;
    END;
