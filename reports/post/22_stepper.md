# 실험 후 레포트: 22 스텝모터 위상 제어

- 작성자: 박건우 (2025440050) / 분반·조: 이준화 교수님, 이해리 조교님 / G조
- 실험일: 2026-09-28
- 소스 커밋: {{COMMIT_URL}}
- 도구·버전: VS Code + Icarus Verilog 12.0 (fpga-lab-template v2.0.2), Vivado 2026.1
- part: xc7s75fgga484-1 / 설계 top: `lab3_stepper` / 시뮬레이션 top: `tb_stepper` / XDC: `lab3_stepper/constraints/lab3_stepper.xdc`
- 수행 PC: 본인 PC (DESKTOP-VM8EHT6)

## Vivado 시뮬레이션 — Vivado 경로

| 구분 | PASS 문자열 | 종료 시각 |
|---|---|---|
| VS Code (Icarus) | `LAB3_STEPPER_PASS checks=8` | 831 ns |
| Vivado (XSim, Run All) | `LAB3_STEPPER_PASS checks=8` | 831 ns |

- Vivado 로그·캡처:
{{VIVADO_22}}
- VS Code 로그·캡처:
{{VSCODE_22}}

## 합성·구현·비트스트림

- 이용률: Slice LUT 20, FF 25 (utilization_placed.rpt)
- DRC: 오류 0건 (CFGBVS-1 경고 1건)
- 타이밍: WNS 16.252 ns, WHS 0.160 ns, 실패 endpoint 0 (All user specified timing constraints are met)
- 경고: 합성 경고 0건, TIMING-18 4건, CFGBVS-1 1건, Project 1-5713 1건 (Vivado Commands)
- bit 경로: {{BIT_PATH_22}} / 크기: {{BIT_SIZE_22}} bytes / SHA-256: {{BIT_SHA_22}}

## 실제 보드 기록·실측

확인 항목: N8=enable, N4=direction으로 정·역회전·정지 유지, 100 step/s

| 조건 | 예상 | 실측 | 사진/영상 시각 | 일치 여부 |
|---|---|---|---|---|
| KEY1 리셋 | 위상 0011, 정지 | 정지 | 영상 참조 | 일치 |
| N8 누름 유지 | 정방향 100 step/s | 정방향 회전 | 영상 참조 | 일치 |
| N8+N4 누름 | 역방향 회전 | 역방향 회전 | 영상 참조 | 일치 |
| N8 놓음 | 정지, 위상 유지 | 정지 후 위치 유지 | 영상 참조 | 일치 |
| 정지 유지 중 발열 | 코일 통전으로 발열 가능 | 관찰하지 않음 | — | — |

- 영상:
{{VIDEOS_22}}
- 사진:
{{PHOTOS_22}}

## 비교·결론

예상값, Icarus·XSim 결과, 보드 실측을 비교한 결과 일치했다. 기능 PASS는 디지털 동작만 검증하며 핀·전기 특성은 보드 관찰로 확인했다.

## 제출 링크

- 폴더: https://github.com/bandnewbie/UOS_ECE_project3/tree/main/lab3_22_stepper
- 커밋: {{COMMIT_URL}}
- 제출일: {{DATE}}
