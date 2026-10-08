# 실험 후 레포트: 25 PC–FPGA UART 에코

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_uart_echo` / 시뮬레이션 top: `tb_uart_echo` / XDC: `lab3_uart_echo/constraints/lab3_uart_echo.xdc`
- 수행 PC: 본인 PC (DESKTOP-VM8EHT6)

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_UART_ECHO_PASS checks=3` | 9,970 ns |
| Vivado (XSim, Run All) | `LAB3_UART_ECHO_PASS checks=3` | 9,910 ns |

- Vivado 로그·캡처:
- [tcl_console.txt](<../../evidence/25/vivado/tcl_console.txt>)
![화면 캡처 2026-09-28 132254](<../../evidence/25/vivado/화면 캡처 2026-09-28 132254.png>)

![화면 캡처 2026-09-28 132632](<../../evidence/25/vivado/화면 캡처 2026-09-28 132632.png>)

- VS Code 로그·캡처:
- [simulation.txt](<../../evidence/25/vscode/simulation.txt>)
- [simulation_modified.txt](<../../evidence/25/vscode/simulation_modified.txt>)
- [simulation_restored.txt](<../../evidence/25/vscode/simulation_restored.txt>)
![wave](<../../evidence/25/vscode/wave.png>)

- [wave.vcd](<../../evidence/25/vscode/wave.vcd>)

## 합성·구현·비트스트림

- 이용률: Slice LUT 134, FF 118 (utilization_placed.rpt)
- DRC: 오류 0건 (CFGBVS-1 경고 1건)
- 타이밍: WNS 14.617 ns, WHS 0.131 ns, 실패 endpoint 0 (All user specified timing constraints are met)
- 경고: 합성 경고 0건, TIMING-18 9건, CFGBVS-1 1건
- bit 경로: lab3_25_uart_echo/vivado/uart_echo.runs/impl_1/lab3_uart_echo.bit / 크기: 3,687,017 bytes / SHA-256: 8e35b4c177126a94ae764feb1aa1f1504560232e6c4c7864d8224d933f41e4ab

## 실제 보드 기록·실측

확인 항목: 9600 8N1에서 문자 하나당 같은 문자 반환, LED에 마지막 수신값

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| 'A' 송신 | 'A' 반환, LED 41 | 'A', LED2·8 | 영상 참조 | 일치 |
| 'Z' 송신 | 'Z' 반환, LED 5A | 'Z', LED2·4·5·7 | 영상 참조 | 일치 |
| 'a' 송신 | 'a' 반환, LED 61 | 'a', LED2·3·8 | 영상 참조 | 일치 |
| KEY1 리셋 | LED 00 | 전부 소등 | 영상 참조 | 일치 |

- 영상:
- [20260928_151243.mp4](<../../evidence/25/board/videos/20260928_151243.mp4>)
- 사진:
![A입력시보드LED](<../../evidence/25/board/photos/A입력시보드LED.png>)

![터미널에서A입력화면](<../../evidence/25/board/photos/터미널에서A입력화면.png>)


## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_25_uart_echo
- 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 제출일: 2026-10-08
