# 실험 후 레포트: 20 RGB LED PWM

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_rgb_pwm` / 시뮬레이션 top: `tb_rgb_pwm` / XDC: `lab3_rgb_pwm/constraints/lab3_rgb_pwm.xdc`
- 수행 PC: 본인 PC (DESKTOP-VM8EHT6)

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_RGB_PWM_PASS checks=2` | 4,431 ns |
| Vivado (XSim, Run All) | `LAB3_RGB_PWM_PASS checks=2` | 4,431 ns |

- Vivado 로그·캡처:
- [tcl_console.txt](<../../evidence/20/vivado/tcl_console.txt>)
![화면 캡처 2026-09-28 151727](<../../evidence/20/vivado/화면 캡처 2026-09-28 151727.png>)

![화면 캡처 2026-09-28 151820](<../../evidence/20/vivado/화면 캡처 2026-09-28 151820.png>)

![화면 캡처 2026-09-28 151848](<../../evidence/20/vivado/화면 캡처 2026-09-28 151848.png>)

- VS Code 로그·캡처:
- [simulation.txt](<../../evidence/20/vscode/simulation.txt>)
- [simulation_modified.txt](<../../evidence/20/vscode/simulation_modified.txt>)
- [simulation_restored.txt](<../../evidence/20/vscode/simulation_restored.txt>)
![wave](<../../evidence/20/vscode/wave.png>)

- [wave.vcd](<../../evidence/20/vscode/wave.vcd>)

## 합성·구현·비트스트림

- 이용률: Slice LUT 276, FF 144 (utilization_placed.rpt)
- DRC: 오류 0건 (CFGBVS-1 경고 1건)
- 타이밍: WNS 8.629 ns, WHS 0.122 ns, 실패 endpoint 0 (All user specified timing constraints are met)
- 경고: 합성 경고 0건, TIMING-18 12건, CFGBVS-1 1건, Project 1-5713 1건 (Vivado Commands)
- bit 경로: lab3_20_rgb_pwm/vivado/rgb_pwm.runs/impl_1/lab3_rgb_pwm.bit / 크기: 3,687,015 bytes / SHA-256: 22dec1a49374f3b179210e21a186c5fcc628bc9926d38d3c2c1d1604482d7dab

## 실제 보드 기록·실측

확인 항목: N8/N4/N1이 각각 R/G/B만 바꾸는지, 혼합색 확인

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| KEY1 리셋 | 세 색 소등 | 소등 | 영상 참조 | 일치 |
| N8(R) 2회 | R 20% | 붉은빛 약하게 | 영상 참조 | 일치 |
| N4(G) 5회 | G 50%, R 유지 | 노란빛 혼합 | 영상 참조 | 일치 |
| N1(B) 8회 | B 80%, R·G 유지 | 푸른빛 강한 혼합색 | 영상 참조 | 일치 |
| N8(R) 1회 더 | R 30%, G·B 유지 | R만 밝아짐 | 영상 참조 | 일치 |
| 한 버튼만 반복 | 해당 색만 변화 | 해당 색만 변화 | 영상 참조 | 일치 |

- 영상:
- [20260928_143655.mp4](<../../evidence/20/board/videos/20260928_143655.mp4>)
- 사진:
시연 대상이 아니어서 사진 없음 (영상으로 기록)

## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_20_rgb_pwm
- 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 제출일: 2026-10-08
