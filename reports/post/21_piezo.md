# 실험 후 레포트: 21 피에조 단일 음

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: {{COMMIT_URL}}
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_piezo` / 시뮬레이션 top: `tb_piezo` / XDC: `lab3_piezo/constraints/lab3_piezo.xdc`
- 수행 PC: 조원 PC (SangHyeok) — 저장소 vivado/ 폴더 비어 있음

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_PIEZO_PASS edges=5` | 551 ns |
| Vivado (XSim, Run All) | `LAB3_PIEZO_PASS edges=5` | 551 ns |

- Vivado 로그·캡처:
{{VIVADO_21}}
- VS Code 로그·캡처:
{{VSCODE_21}}

## 합성·구현·비트스트림

- 경고: 조원 PC에서 수행 (Vivado Commands 경고 2건: filemgmt 56-12)
- bit 경로: {{BIT_PATH_21}} / 크기: {{BIT_SIZE_21}} bytes / SHA-256: {{BIT_SHA_21}}

## 실제 보드 기록·실측

확인 항목: 약 294 Hz 단일 음 발생, KEY1 리셋 중 무음

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| KEY1 누름 유지 | 무음 (piezo=0) | 무음 | 영상 참조 | 일치 |
| 리셋 해제 | 연속음 | 일정한 단일 음 | 영상 참조 | 일치 |
| 출력 주파수 | ≈ 293.9995 Hz | 측정하지 않음 | — | — |
| 음 높이 변화 | 없음 (고정 음) | 변화 없음 | 영상 참조 | 일치 |

- 영상:
{{VIDEOS_21}}
- 사진:
{{PHOTOS_21}}

## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_21_piezo
- 커밋: {{COMMIT_URL}}
- 제출일: {{DATE}}
