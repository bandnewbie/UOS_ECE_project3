# 실험 후 레포트: 21 피에조 단일 음

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_piezo` / 시뮬레이션 top: `tb_piezo` / XDC: `lab3_piezo/constraints/lab3_piezo.xdc`
- 수행 PC: 조원 PC (SangHyeok) — 저장소 vivado/ 폴더 비어 있음

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_PIEZO_PASS edges=5` | 551 ns |
| Vivado (XSim, Run All) | `LAB3_PIEZO_PASS edges=5` | 551 ns |

- Vivado 로그·캡처:
- [tcl_console.txt](<../../evidence/21/vivado/tcl_console.txt>)
![화면 캡처 2026-09-28 130558](<../../evidence/21/vivado/화면 캡처 2026-09-28 130558.png>)

![화면 캡처 2026-09-28 131540](<../../evidence/21/vivado/화면 캡처 2026-09-28 131540.png>)

![화면 캡처 2026-09-28 131924](<../../evidence/21/vivado/화면 캡처 2026-09-28 131924.png>)

- VS Code 로그·캡처:
- [simulation.txt](<../../evidence/21/vscode/simulation.txt>)
- [simulation_modified.txt](<../../evidence/21/vscode/simulation_modified.txt>)
- [simulation_restored.txt](<../../evidence/21/vscode/simulation_restored.txt>)
![wave](<../../evidence/21/vscode/wave.png>)

- [wave.vcd](<../../evidence/21/vscode/wave.vcd>)

## 합성·구현·비트스트림

- 경고: 조원 PC에서 수행 (Vivado Commands 경고 2건: filemgmt 56-12)
- bit 경로: 조원 PC에서 생성 (저장소 미포함) / 크기: - bytes / SHA-256: 조원 PC 보관

## 실제 보드 기록·실측

확인 항목: 약 294 Hz 단일 음 발생, KEY1 리셋 중 무음

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| KEY1 누름 유지 | 무음 (piezo=0) | 무음 | 영상 참조 | 일치 |
| 리셋 해제 | 연속음 | 일정한 단일 음 | 영상 참조 | 일치 |
| 출력 주파수 | ≈ 293.9995 Hz | 측정하지 않음 | — | — |
| 음 높이 변화 | 없음 (고정 음) | 변화 없음 | 영상 참조 | 일치 |

- 영상:
- [20260928_143228.mp4](<../../evidence/21/board/videos/20260928_143228.mp4>)
- 사진:
시연 대상이 아니어서 사진 없음 (영상으로 기록)

## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_21_piezo
- 커밋: [e17fc28](https://github.com/bandnewbie/UOS_ECE_project3/commit/e17fc28a6007147874ccfc1bbdadceca447086d9)
- 제출일: 2026-10-08
