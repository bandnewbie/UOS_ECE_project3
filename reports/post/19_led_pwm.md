# 실험 후 레포트: 19 PWM LED 밝기

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_led_pwm` / 시뮬레이션 top: `tb_led_pwm` / XDC: `lab3_led_pwm/constraints/lab3_led_pwm.xdc`
- 수행 PC: 조원 PC (SangHyeok) — 저장소 vivado/ 폴더 비어 있음

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_LED_PWM_PASS checks=4` | 3,831 ns |
| Vivado (XSim, Run All) | `LAB3_LED_PWM_PASS checks=4` | 3,831 ns |

- Vivado 로그·캡처:
- [tcl_console.txt](<../../evidence/19/vivado/tcl_console.txt>)
![화면 캡처 2026-09-28 125233](<../../evidence/19/vivado/화면 캡처 2026-09-28 125233.png>)

![화면 캡처 2026-09-28 125631](<../../evidence/19/vivado/화면 캡처 2026-09-28 125631.png>)

![화면 캡처 2026-09-28 125734](<../../evidence/19/vivado/화면 캡처 2026-09-28 125734.png>)

- VS Code 로그·캡처:
- [simulation.txt](<../../evidence/19/vscode/simulation.txt>)
- [simulation_modified.txt](<../../evidence/19/vscode/simulation_modified.txt>)
- [simulation_restored.txt](<../../evidence/19/vscode/simulation_restored.txt>)
![wave](<../../evidence/19/vscode/wave.png>)

- [wave.vcd](<../../evidence/19/vscode/wave.vcd>)

## 합성·구현·비트스트림

- 경고: 조원 PC에서 수행 (Vivado Commands 경고 1건: Vivado 12-1017)
- bit 경로: 조원 PC에서 생성 (저장소 미포함) / 크기: - bytes / SHA-256: 조원 PC 보관

## 실제 보드 기록·실측

확인 항목: N8 버튼을 누를 때마다 duty 0→10→…→100%→0% 순환, 8개 LED 밝기 확인

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| KEY1 리셋 | 소등 (0%) | 소등 | 영상 참조 | 일치 |
| N8 1회 | 10% 밝기 | 어둡게 점등 | 영상 참조 | 일치 |
| N8 누적 3회 | 30% 밝기 | 중간보다 어둡게 | 영상 참조 | 일치 |
| N8 누적 10회 | 100% (최대) | 최대 밝기 | 영상 참조 | 일치 |
| N8 1회 더 | 0% (순환) | 소등 | 영상 참조 | 일치 |
| N8 길게 누름 | 1단계만 증가 | 1단계만 증가 | 영상 참조 | 일치 |

- 영상:
- [20260928_142921.mp4](<../../evidence/19/board/videos/20260928_142921.mp4>)
- 사진:
시연 대상이 아니어서 사진 없음 (영상으로 기록)

## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_19_led_pwm
- 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 제출일: 2026-10-08
