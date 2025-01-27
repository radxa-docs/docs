# 在 Radxa 10HD 显示屏上显示 开机 Logo

## 编译 u-boot

参考 U-boot 开发编译一次 next-dev-v2024.10 的 U-boot

```bash

./bsp u-boot rk2410

```

## 添加 u-boot 驱动的宏定义

在 .src/u-boot/configs/radxa-cm5-io-rk3588s_defconfig 中添加 u-boot 驱动的宏定义

```defconfig

CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DSC=y
CONFIG_DRM_ROCKCHIP_PANEL=y
CONFIG_DM_PWM=y
CONFIG_BACKLIGHT_PWM=y

CONFIG_LOGLEVEL=8
CONFIG_VIDEO_ROCKCHIP=y
CONFIG_DRM_ROCKCHIP_DW_MIPI_DSI=y

CONFIG_DRM_ROCKCHIP_INNO_MIPI_PHY=y
CONFIG_DRM_ROCKCHIP_INNO_VIDEO_PHY=y
CONFIG_DRM_ROCKCHIP_INNO_VIDEO_COMBO_PHY=y

```

## 配置 dts

在 .src/u-boot/arch/arm/dts/rk3588s-radxa-cm5-io.dts 中添加 dts 配置屏幕设备树

### 在根节点中添加背光

```dts

/ {
	backlight: backlight {
		status = "okay";
		compatible = "pwm-backlight";
		pwms = <&pwm15 0 25000 0>;
		brightness-levels = <
			  0  20  20  21  21  22  22  23
			 23  24  24  25  25  26  26  27
			 27  28  28  29  29  30  30  31
			 31  32  32  33  33  34  34  35
			 35  36  36  37  37  38  38  39
			 40  41  42  43  44  45  46  47
			 48  49  50  51  52  53  54  55
			 56  57  58  59  60  61  62  63
			 64  65  66  67  68  69  70  71
			 72  73  74  75  76  77  78  79
			 80  81  82  83  84  85  86  87
			 88  89  90  91  92  93  94  95
			 96  97  98  99 100 101 102 103
			104 105 106 107 108 109 110 111
			112 113 114 115 116 117 118 119
			120 121 122 123 124 125 126 127
			128 129 130 131 132 133 134 135
			136 137 138 139 140 141 142 143
			144 145 146 147 148 149 150 151
			152 153 154 155 156 157 158 159
			160 161 162 163 164 165 166 167
			168 169 170 171 172 173 174 175
			176 177 178 179 180 181 182 183
			184 185 186 187 188 189 190 191
			192 193 194 195 196 197 198 199
			200 201 202 203 204 205 206 207
			208 209 210 211 212 213 214 215
			216 217 218 219 220 221 222 223
			224 225 226 227 228 229 230 231
			232 233 234 235 236 237 238 239
			240 241 242 243 244 245 246 247
			248 249 250 251 252 253 254 255
		>;
		default-brightness-level = <200>;
		enable-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
		pinctrl-names = "default";
		pinctrl-0 = <&dsi1_backlight_en>;
	};

};

```

### 添加 pinctrl 设备树

```dts

&pinctrl {
	dsi1-lcd {
		dsi1_lcd_rst_gpio: dsi1-lcd-rst-gpio {
			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
		};

		dsi1_backlight_en: dsi1-backlight-en {
			rockchip,pins = <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
		};
	};
};

```

### 配置 dsi 节点

```dts

&dsi1 {
	status = "okay";
	rockchip,lane-rate = <480>;
	// #address-cells = <1>;
	// #size-cells = <0>;

	dsi1_panel: panel@0 {
		status = "okay";
		compatible = "simple-panel-dsi";
		reg = <0>;
		backlight = <&backlight>;

		power-supply = <&vcc_lcd1_3v3>,<&vcc_1v8_s0>;

		reset-gpios = <&gpio1 RK_PB0 GPIO_ACTIVE_LOW>;
		pinctrl-names = "default";
		pinctrl-0 = <&dsi1_lcd_rst_gpio>;

		prepare-delay-ms = <120>;
		reset-delay-ms = <120>;
		init-delay-ms = <120>;
		stbyb-delay-ms = <120>;
		enable-delay-ms = <100>;
		disable-delay-ms = <120>;
		unprepare-delay-ms = <120>;

		width-mm = <62>;
		height-mm = <110>;

		dsi,flags = <(MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
				MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET)>;
		dsi,format = <MIPI_DSI_FMT_RGB888>;
		dsi,lanes = <4>;

		panel-init-sequence = [
			15 00 02 E0 00
			15 00 02 E1 93
			15 00 02 E2 65
			15 00 02 E3 F8
			15 00 02 80 03
			15 00 02 E0 01
			15 00 02 00 00
			15 00 02 01 3B
			15 00 02 0C 74
			15 00 02 17 00
			15 00 02 18 AF
			15 00 02 19 00
			15 00 02 1A 00
			15 00 02 1B AF
			15 00 02 1C 00
			15 00 02 35 26
			15 00 02 37 09
			15 00 02 38 04
			15 00 02 39 00
			15 00 02 3A 01
			15 00 02 3C 78
			15 00 02 3D FF
			15 00 02 3E FF
			15 00 02 3F 7F
			15 00 02 40 06
			15 00 02 41 A0
			15 00 02 42 81
			15 00 02 43 14
			15 00 02 44 23
			15 00 02 45 28
			15 00 02 55 02
			15 00 02 57 69
			15 00 02 59 0A
			15 00 02 5A 2A
			15 00 02 5B 17
			15 00 02 5D 7F
			15 00 02 5E 6B
			15 00 02 5F 5C
			15 00 02 60 4F
			15 00 02 61 4D
			15 00 02 62 3F
			15 00 02 63 42
			15 00 02 64 2B
			15 00 02 65 44
			15 00 02 66 43
			15 00 02 67 43
			15 00 02 68 63
			15 00 02 69 52
			15 00 02 6A 5A
			15 00 02 6B 4F
			15 00 02 6C 4E
			15 00 02 6D 20
			15 00 02 6E 0F
			15 00 02 6F 00
			15 00 02 70 7F
			15 00 02 71 6B
			15 00 02 72 5C
			15 00 02 73 4F
			15 00 02 74 4D
			15 00 02 75 3F
			15 00 02 76 42
			15 00 02 77 2B
			15 00 02 78 44
			15 00 02 79 43
			15 00 02 7A 43
			15 00 02 7B 63
			15 00 02 7C 52
			15 00 02 7D 5A
			15 00 02 7E 4F
			15 00 02 7F 4E
			15 00 02 80 20
			15 00 02 81 0F
			15 00 02 82 00
			15 00 02 E0 02
			15 00 02 00 02
			15 00 02 01 02
			15 00 02 02 00
			15 00 02 03 00
			15 00 02 04 1E
			15 00 02 05 1E
			15 00 02 06 1F
			15 00 02 07 1F
			15 00 02 08 1F
			15 00 02 09 17
			15 00 02 0A 17
			15 00 02 0B 37
			15 00 02 0C 37
			15 00 02 0D 47
			15 00 02 0E 47
			15 00 02 0F 45
			15 00 02 10 45
			15 00 02 11 4B
			15 00 02 12 4B
			15 00 02 13 49
			15 00 02 14 49
			15 00 02 15 1F
			15 00 02 16 01
			15 00 02 17 01
			15 00 02 18 00
			15 00 02 19 00
			15 00 02 1A 1E
			15 00 02 1B 1E
			15 00 02 1C 1F
			15 00 02 1D 1F
			15 00 02 1E 1F
			15 00 02 1F 17
			15 00 02 20 17
			15 00 02 21 37
			15 00 02 22 37
			15 00 02 23 46
			15 00 02 24 46
			15 00 02 25 44
			15 00 02 26 44
			15 00 02 27 4A
			15 00 02 28 4A
			15 00 02 29 48
			15 00 02 2A 48
			15 00 02 2B 1F
			15 00 02 2C 01
			15 00 02 2D 01
			15 00 02 2E 00
			15 00 02 2F 00
			15 00 02 30 1F
			15 00 02 31 1F
			15 00 02 32 1E
			15 00 02 33 1E
			15 00 02 34 1F
			15 00 02 35 17
			15 00 02 36 17
			15 00 02 37 37
			15 00 02 38 37
			15 00 02 39 08
			15 00 02 3A 08
			15 00 02 3B 0A
			15 00 02 3C 0A
			15 00 02 3D 04
			15 00 02 3E 04
			15 00 02 3F 06
			15 00 02 40 06
			15 00 02 41 1F
			15 00 02 42 02
			15 00 02 43 02
			15 00 02 44 00
			15 00 02 45 00
			15 00 02 46 1F
			15 00 02 47 1F
			15 00 02 48 1E
			15 00 02 49 1E
			15 00 02 4A 1F
			15 00 02 4B 17
			15 00 02 4C 17
			15 00 02 4D 37
			15 00 02 4E 37
			15 00 02 4F 09
			15 00 02 50 09
			15 00 02 51 0B
			15 00 02 52 0B
			15 00 02 53 05
			15 00 02 54 05
			15 00 02 55 07
			15 00 02 56 07
			15 00 02 57 1F
			15 00 02 58 40
			15 00 02 5B 30
			15 00 02 5C 16
			15 00 02 5D 34
			15 00 02 5E 05
			15 00 02 5F 02
			15 00 02 63 00
			15 00 02 64 6A
			15 00 02 67 73
			15 00 02 68 1D
			15 00 02 69 08
			15 00 02 6A 6A
			15 00 02 6B 08
			15 00 02 6C 00
			15 00 02 6D 00
			15 00 02 6E 00
			15 00 02 6F 88
			15 00 02 75 FF
			15 00 02 77 DD
			15 00 02 78 3F
			15 00 02 79 15
			15 00 02 7A 17
			15 00 02 7D 14
			15 00 02 7E 82
			15 00 02 E0 04
			15 00 02 00 0E
			15 00 02 02 B3
			15 00 02 09 61
			15 00 02 0E 48
			15 00 02 E0 00
			15 00 02 E6 02
			15 00 02 E7 0C
			05 78 01 11
			05 14 01 29
		];

		panel-exit-sequence = [
			05 00 01 28
			05 00 01 10
		];

		disp_timings1: display-timings {
			native-mode = <&dsi1_timing0>;

			dsi1_timing0: timing0 {
				clock-frequency = <70000000>;
				hactive = <800>;
				vactive = <1280>;

				hsync-len = <18>;
				hback-porch = <20>;
				hfront-porch = <40>;

				vsync-len = <4>;
				vback-porch = <20>;
				vfront-porch = <20>;

				hsync-active = <0>;
				vsync-active = <0>;
				de-active = <0>;
				pixelclk-active = <1>;
			};
		};

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				panel_in_dsi1: endpoint {
					remote-endpoint = <&dsi1_out_panel>;
				};
			};
		};
	};

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@1 {
			reg = <1>;
			dsi1_out_panel: endpoint {
				remote-endpoint = <&panel_in_dsi1>;
			};
		};
	};
};

```

### 使能 pwm

```dts

&pwm15 {
	status = "okay";
	pinctrl-names = "active";
	pinctrl-0 = <&pwm15m1_pins>;
};

```

### 使能 mipi phy

```dts

&mipi_dcphy1 {
	status = "okay";
};

```

### 绑定 vop

```dts

&route_dsi1 {
	status = "okay";
	connect = <&vp3_out_dsi1>;
};

&dsi1_in_vp2 {
	status = "disabled";
};

&dsi1_in_vp3 {
	status = "okay";
};

&display_subsystem {
	status = "okay";
};

```

## 使能设备树

我们需要在 .src/u-boot/arch/arm/dts/rk3588s-radxa-cm5-io-u-boot.dtsi 中将以上节点使能， 即在以上每个节点中添加 "u-boot,dm-pre-reloc;" 属性

```dtsi

&vcc_lcd1_3v3 {
	u-boot,dm-pre-reloc;
};

&dsi1_backlight_en {
	u-boot,dm-pre-reloc;
};

&pwm15 {
	u-boot,dm-pre-reloc;
};

&backlight {
	u-boot,dm-pre-reloc;
};

&dsi1 {
	u-boot,dm-pre-reloc;
};

&dsi1_panel {
	u-boot,dm-pre-reloc;
};

&mipi_dcphy1 {
	u-boot,dm-pre-reloc;
};

&route_dsi1 {
	u-boot,dm-pre-reloc;
};

&vp2_out_dsi1 {
	u-boot,dm-pre-reloc;
};

&dsi1_in_vp2 {
	u-boot,dm-pre-reloc;
};

&dsi1_in_vp3 {
	u-boot,dm-pre-reloc;
};

&vp3_out_dsi1 {
	u-boot,dm-pre-reloc;
};

&mipidcphy1 {
	u-boot,dm-pre-reloc;
};

&dsi1_timing0 {
	u-boot,dm-pre-reloc;
};

&pwm15m1_pins {
	u-boot,dm-pre-reloc;
};

&dsi1_in {
	u-boot,dm-pre-reloc;
};

&hdptxphy_hdmi_clk0 {
	u-boot,dm-pre-reloc;
};

&dsi1_lcd_rst_gpio {
	u-boot,dm-pre-reloc;
};

&drm_logo {
	u-boot,dm-pre-reloc;
};

&disp_timings1 {
	u-boot,dm-pre-reloc;
};

&dsi1_timing0 {
	u-boot,dm-pre-reloc;
};

&dsi1_out_panel {
	u-boot,dm-pre-reloc;
};

&panel_in_dsi1 {
	u-boot,dm-pre-reloc;
};

```

## 替换 u-boot

### 重新编译 u-boot

```bash

./bsp u-boot rk2410 --no-prepare-source

```

### 替换板子上的 u-boot

- 将 .root/usr/lib/u-boot/radxa-cm5-io/ 文件夹拷贝到 Radxa CM5 IO 上

```bash

scp -r .root/usr/lib/u-boot/radxa-cm5-io/ radxa@192.168.xx.xx:~/

```

- 更新 u-boot

```bash

sudo mv radxa-cm5-io /usr/lib/u-boot/radxa-cm5-io

sync

```

使用 rsetup 来更新 u-boot

## 添加开机图片

选择两张图片， 一张命名为 logo.bmp, 另一张命名为 log_kernel.bmp, 并将这两张拷贝到 /config 目录中

:::tip

图片总像素数不能超过 200000

:::
