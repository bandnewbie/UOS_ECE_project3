# 실험 후 레포트: 24 문자 LCD 제어

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: {{COMMIT_URL}}
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_character_lcd` / 시뮬레이션 top: `tb_character_lcd` / XDC: `lab3_character_lcd/constraints/lab3_character_lcd.xdc`
- 수행 PC: 본인 PC (DESKTOP-VM8EHT6)

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_LCD_PASS bytes=40` | 8,130 ns |
| Vivado (XSim, Run All) | `LAB3_LCD_PASS bytes=40` | 8,130 ns |

- Vivado 로그·캡처:
{{VIVADO_24}}
- VS Code 로그·캡처:
{{VSCODE_24}}

## 합성·구현·비트스트림

- 이용률: Slice LUT 111, FF 93 (utilization_placed.rpt)
- DRC: 오류 0건 (CFGBVS-1 경고 1건)
- 타이밍: WNS 14.220 ns, WHS 0.167 ns, 실패 endpoint 0 (All user specified timing constraints are met)
- 경고: 합성 경고 3건 (Synth 8-3917 ×2, 8-3332), TIMING-18 10건, CFGBVS-1 1건
- bit 경로: {{BIT_PATH_24}} / 크기: {{BIT_SIZE_24}} bytes / SHA-256: {{BIT_SHA_24}}

## 실제 보드 기록·실측

확인 항목: 첫째 줄 FPGA LAB3, 둘째 줄 LCD CONTROLLER 표시

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| bit 기록 후 | 첫째 줄 FPGA LAB3 | FPGA LAB3 | 영상 참조 | 일치 |
| bit 기록 후 | 둘째 줄 LCD CONTROLLER | LCD CONTROLLER | 영상 참조 | 일치 |
| KEY1 리셋 | 재초기화 후 같은 문자열 | 같은 문자열 | 영상 참조 | 일치 |
| 커서 | 표시 안 됨 (0C) | 커서 없음 | 영상 참조 | 일치 |

- 영상:
{{VIDEOS_24}}
- 사진:
{{PHOTOS_24}}

## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_24_character_lcd
- 커밋: {{COMMIT_URL}}
- 제출일: {{DATE}}
