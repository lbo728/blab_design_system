# Figma Visual Mirror

BLab Design System의 **시각 레퍼런스(optional visual mirror)**. 스킬(`~/.claude/skills/blab-design/`) 기반 SSOT가 원본이고, Figma 파일은 비개발자/디자이너 협업용 미러.

- **File**: `Blab Design System` (fileKey `tOz5Wt6IsQyfDL7loNeUw5`)
- **URL**: https://www.figma.com/design/tOz5Wt6IsQyfDL7loNeUw5/Blab-Design-System
- **Status**: Phase 3 (BLA-6) 진행 완료 — 6개 고급 컴포넌트 이식

## 페이지 구조

| 페이지 | 역할 |
|--------|------|
| `00. Cover` | 표지 (예약) |
| `01. Foundations` | 토큰/프리미티브 정리 (예약) |
| `02. Primitives` | 기본 원자 (예약) |
| `03. Components` | 조합된 컴포넌트 (현재 채워진 페이지) |

## Variables Collections

| Collection | 변수 수 | 모드 |
|------------|---------|------|
| `BLab/Colors` | 38 | Light 전용 (Figma Free plan은 멀티모드 미지원 — Dark는 `tokens.css` 기반 코드에서 처리) |
| `BLab/Radius` | 6 | xs/sm/md/lg/xl/pill |
| `BLab/Spacing` | 12 | 0~11 (2,4,8,12,16,20,24,32,40,48,64) |

## `03. Components` 페이지 구성

### Navigation 섹션

| 컴포넌트 | Variants | 축 |
|----------|----------|----|
| `BLab/BottomBar` | 12 | ItemCount(3/4/5) × Style(Solid/Glass) × SafeArea(On/Off) |
| `BLab/TabBar` | 18 | TabCount(2/3/4) × SelectedIndex × Divider(On/Off) |

### Feedback 섹션

| 컴포넌트 | Variants | 축 |
|----------|----------|----|
| `BLab/Snackbar` | 8 | Type(Success/Error/Warning/Info) × Action(None/WithAction) |

### Controls 섹션

| 컴포넌트 | Variants | 축 |
|----------|----------|----|
| `BLab/SegmentedControl` | 18 | Size(Small/Medium) × SegmentCount(2/3/4) × SelectedIndex |

### Utility 섹션

| 컴포넌트 | Variants | 축 |
|----------|----------|----|
| `BLab/KeyboardAccessoryBar` | 2 | Layout(Default/WithActions) |
| `BLab/PressableWrapper` | 2 | State(Default/Pressed, scale 0.95) |

## Flutter 원본 매핑

| Figma 컴포넌트 | Flutter 위젯 |
|----------------|--------------|
| `BLab/BottomBar` | `lib/src/widgets/liquid_glass_bottom_bar.dart` |
| `BLab/TabBar` | `lib/src/widgets/liquid_glass_tab_bar.dart` |
| `BLab/Snackbar` | `lib/src/widgets/blab_snackbar.dart` |
| `BLab/SegmentedControl` | `lib/src/widgets/blab_segmented_control.dart` |
| `BLab/KeyboardAccessoryBar` | `lib/src/widgets/keyboard_accessory_bar.dart` |
| `BLab/PressableWrapper` | `lib/src/widgets/pressable_wrapper.dart` |

## 시스템 Audit 결과 (2026-04-21)

`figma_audit_design_system` 기준:

| 항목 | 점수 |
|------|------|
| **Overall Health** | 62/100 (needs-work) |
| Naming & Semantics | 100/100 |
| Consistency | 100/100 |
| Component Metadata | 83/100 |
| Accessibility | 67/100 |
| Token Architecture | 0/100 (Free plan 한계) |
| Coverage | 0/100 (01/02 페이지 아직 비어있음) |

Token Architecture 점수가 0인 건 Free plan에서 멀티모드 불가 탓. 다크 모드는 `tokens.css`와 `lib/src/theme/app_colors.dart`에서 처리한다.

## Typography

모든 컴포넌트는 **Pretendard Variable** 사용 (CDN fallback). `tokens.css`의 type scale과 1:1:

- BottomBar 탭 라벨: `--blab-tab-size` (10px) / Medium
- TabBar / SegmentedControl 라벨: `--blab-label-size` (13~14px)
- Snackbar 본문: 15px Medium / 액션 15px SemiBold
- KeyboardAccessoryBar "완료": 16px SemiBold

## 유지보수 원칙

1. **SSOT는 스킬**. Figma는 미러일 뿐 원본이 아님.
2. Flutter 위젯이나 `tokens.css`를 변경하면 Figma도 갱신 필요.
3. Dark mode는 코드에서만 존재. Figma에는 Light 값만 들어 있음 (Free plan).
4. 신규 컴포넌트 추가 시 **03. Components 페이지**의 해당 Section에 배치.
