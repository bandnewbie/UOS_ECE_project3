# 실험 후 레포트: 23 MM:SS 시계

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_mmss_clock` / 시뮬레이션 top: `tb_mmss_counter` / XDC: `lab3_mmss_clock/constraints/lab3_mmss_clock.xdc`
- 수행 PC: 조원 PC (SangHyeok) — 저장소 vivado/ 폴더 비어 있음

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_MMSS_PASS checks=7` | 144,031 ns |
| Vivado (XSim, Run All) | `LAB3_MMSS_PASS checks=7` | 144,030 ns |

- Vivado 로그·캡처:
- [tcl_console.txt](<../../evidence/23/vivado/tcl_console.txt>)
![화면 캡처 2026-09-28 133435](<../../evidence/23/vivado/화면 캡처 2026-09-28 133435.png>)

![화면 캡처 2026-09-28 134810](<../../evidence/23/vivado/화면 캡처 2026-09-28 134810.png>)

![화면 캡처 2026-09-28 134930](<../../evidence/23/vivado/화면 캡처 2026-09-28 134930.png>)

- VS Code 로그·캡처:
- [simulation.txt](<../../evidence/23/vscode/simulation.txt>)
- [simulation_modified.txt](<../../evidence/23/vscode/simulation_modified.txt>)
- [simulation_restored.txt](<../../evidence/23/vscode/simulation_restored.txt>)
![wave](<../../evidence/23/vscode/wave.png>)

- [wave.vcd](<../../evidence/23/vscode/wave.vcd>)

## 합성·구현·비트스트림

- 경고: 합성 경고 4건 (Synth 8-3917 외), Vivado Commands 경고 3건 (filemgmt 56-12, Vivado 12-1017) — 조원 PC에서 수행
- bit 경로: 조원 PC에서 생성 (저장소 미포함) / 크기: - bytes / SHA-256: 조원 PC 보관

## 실제 보드 기록·실측

확인 항목: 00:00부터 1초 간격 증가, 자리올림, 59:59→00:00, 분·초 구분 dp

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| KEY1 리셋 | 00.00 | 00.00 | 영상 참조 | 일치 |
| 1초 경과 | 00.01 | 1초 간격 증가 | 영상 참조 | 일치 |
| 10초 경과 | 00.10 (자리올림) | 00.10 | 영상 참조 | 일치 |
| 60초 경과 | 01.00 | 01.00 | 영상 참조 | 일치 |
| 59:59 다음 | 00.00 | 시뮬레이션으로 확인 | — | — |
| 표시 상태 | 네 자리 동시 점등처럼 보임 | 깜박임 없음 | 영상 참조 | 일치 |

- 영상:
- [20260928_150634.mp4](<../../evidence/23/board/videos/20260928_150634.mp4>)
- 사진:
시연 대상이 아니어서 사진 없음 (영상으로 기록)

## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_23_mmss_clock
- 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 제출일: 2026-10-08
