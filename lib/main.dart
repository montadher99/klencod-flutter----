<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>فانتازي الصبخاية - Fantasy Al-Sebkhaya</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Arabic Font: Cairo -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        fantasy: {
                            bg: '#0f051d',
                            card: '#1d0c36',
                            surface: '#29124a',
                            accent: '#00ff87',
                            cyan: '#02efff',
                            pink: '#ff007a',
                            pitch: '#1b4d2e',
                            pitchDark: '#123620'
                        }
                    },
                    fontFamily: {
                        cairo: ['Cairo', 'sans-serif']
                    }
                }
            }
        }
    </script>
    <style>
        body {
            font-family: 'Cairo', sans-serif;
            background-color: #0f051d;
            color: #ffffff;
            overflow-x: hidden;
        }
        /* Football Pitch Styling */
        .pitch-bg {
            background: linear-gradient(to bottom, #164026 0%, #1c5231 50%, #164026 100%);
            position: relative;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 16px;
            box-shadow: inset 0 0 40px rgba(0,0,0,0.6);
            overflow: hidden;
        }
        .pitch-lines {
            position: absolute;
            inset: 0;
            pointer-events: none;
        }
        .pitch-line {
            border: 2px solid rgba(255, 255, 255, 0.25);
        }
        .center-circle {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.25);
        }
        .penalty-area-top {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            height: 18%;
            border: 2px solid rgba(255, 255, 255, 0.25);
            border-top: none;
        }
        .penalty-area-bottom {
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            height: 18%;
            border: 2px solid rgba(255, 255, 255, 0.25);
            border-bottom: none;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #0f051d;
        }
        ::-webkit-scrollbar-thumb {
            background: #29124a;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #00ff87;
        }

        .glow-effect {
            box-shadow: 0 0 15px rgba(0, 255, 135, 0.3);
        }
        .glow-text {
            text-shadow: 0 0 10px rgba(0, 255, 135, 0.5);
        }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between">

    <!-- Top Navigation Header -->
    <header class="bg-fantasy-card/90 backdrop-blur-md border-b border-purple-900/40 sticky top-0 z-50 px-4 py-3">
        <div class="max-w-7xl mx-auto flex flex-wrap justify-between items-center gap-4">
            <!-- App Logo & Title -->
            <div class="flex items-center gap-3">
                <div class="w-11 h-11 bg-gradient-to-tr from-fantasy-pink via-purple-600 to-fantasy-accent rounded-xl flex items-center justify-center text-white text-2xl shadow-lg glow-effect">
                    <i class="fa-solid fa-trophy"></i>
                </div>
                <div>
                    <h1 class="text-xl font-black tracking-wide text-white flex items-center gap-2">
                        فانتازي الصبخاية
                        <span class="text-xs font-semibold px-2 py-0.5 rounded-full bg-fantasy-accent text-black font-bold">الموسم الجديد</span>
                    </h1>
                    <p class="text-xs text-gray-400">الدوري الرسمي لعشاق كرة القدم في الصبخاية</p>
                </div>
            </div>

            <!-- Main Navigation Tabs -->
            <nav class="flex items-center gap-1 bg-fantasy-bg p-1 rounded-xl border border-purple-900/50 text-sm font-bold">
                <button onclick="switchTab('dashboard')" id="tab-btn-dashboard" class="px-4 py-2 rounded-lg flex items-center gap-2 text-fantasy-accent bg-fantasy-surface shadow transition">
                    <i class="fa-solid fa-chart-line"></i>
                    <span>التشكيلة واللوحة</span>
                </button>
                <button onclick="switchTab('transfers')" id="tab-btn-transfers" class="px-4 py-2 rounded-lg flex items-center gap-2 text-gray-400 hover:text-white transition">
                    <i class="fa-solid fa-right-left"></i>
                    <span>الانتقالات</span>
                </button>
                <button onclick="switchTab('standings')" id="tab-btn-standings" class="px-4 py-2 rounded-lg flex items-center gap-2 text-gray-400 hover:text-white transition">
                    <i class="fa-solid fa-list-ol"></i>
                    <span>الترتيب</span>
                </button>
                <button onclick="switchTab('fixtures')" id="tab-btn-fixtures" class="px-4 py-2 rounded-lg flex items-center gap-2 text-gray-400 hover:text-white transition">
                    <i class="fa-solid fa-calendar-days"></i>
                    <span>المباريات</span>
                </button>
                <button onclick="switchTab('flutter-code')" id="tab-btn-flutter-code" class="px-4 py-2 rounded-lg flex items-center gap-2 text-fantasy-cyan hover:text-white transition bg-fantasy-surface/50 border border-fantasy-cyan/30">
                    <i class="fa-solid fa-code"></i>
                    <span>كود فلاتر (Flutter Code)</span>
                </button>
            </nav>
        </div>
    </header>

    <!-- Main Content Body -->
    <main class="max-w-7xl mx-auto w-full px-4 py-6 flex-grow">

        <!-- ==================== TAB 1: DASHBOARD / PITCH ==================== -->
        <div id="tab-dashboard" class="space-y-6">
            <!-- GW Quick Overview Cards -->
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div class="bg-fantasy-card p-4 rounded-2xl border border-purple-900/40 relative overflow-hidden">
                    <div class="text-xs text-gray-400 font-bold mb-1">الجولة الحالية</div>
                    <div class="text-2xl font-black text-fantasy-accent">الجولة 14</div>
                    <div class="text-xs text-gray-400 mt-1">الموعد النهائي: الجمعة 7:00 م</div>
                    <i class="fa-solid fa-clock absolute left-3 bottom-3 text-4xl text-purple-900/20"></i>
                </div>
                <div class="bg-fantasy-card p-4 rounded-2xl border border-purple-900/40 relative overflow-hidden">
                    <div class="text-xs text-gray-400 font-bold mb-1">نقاط الجولة</div>
                    <div class="text-2xl font-black text-fantasy-cyan" id="gw-points-display">68 نقطة</div>
                    <div class="text-xs text-green-400 mt-1">أعلى من المتوسط (+14)</div>
                    <i class="fa-solid fa-star absolute left-3 bottom-3 text-4xl text-purple-900/20"></i>
                </div>
                <div class="bg-fantasy-card p-4 rounded-2xl border border-purple-900/40 relative overflow-hidden">
                    <div class="text-xs text-gray-400 font-bold mb-1">الترتيب العام</div>
                    <div class="text-2xl font-black text-yellow-400"># 3</div>
                    <div class="text-xs text-green-400 mt-1"><i class="fa-solid fa-arrow-up"></i> ارتفعت 2 مركزين</div>
                    <i class="fa-solid fa-ranking-star absolute left-3 bottom-3 text-4xl text-purple-900/20"></i>
                </div>
                <div class="bg-fantasy-card p-4 rounded-2xl border border-purple-900/40 relative overflow-hidden">
                    <div class="text-xs text-gray-400 font-bold mb-1">إجمالي النقاط</div>
                    <div class="text-2xl font-black text-white">842 نقطة</div>
                    <div class="text-xs text-gray-400 mt-1">اسم الفريق: صقور الصبخاية</div>
                    <i class="fa-solid fa-shield-halved absolute left-3 bottom-3 text-4xl text-purple-900/20"></i>
                </div>
            </div>

            <!-- Main Layout Grid: Pitch + Chips Sidebar -->
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-6">
                
                <!-- Football Pitch Column -->
                <div class="lg:col-span-8 bg-fantasy-card p-4 rounded-2xl border border-purple-900/40 flex flex-col items-center">
                    <div class="w-full flex justify-between items-center mb-4 px-2">
                        <h2 class="font-bold text-lg text-white flex items-center gap-2">
                            <i class="fa-solid fa-shirt text-fantasy-accent"></i>
                            التشكيلة الأساسية (4-3-3)
                        </h2>
                        <div class="flex gap-2 text-xs">
                            <span class="bg-fantasy-surface px-3 py-1 rounded-full text-gray-300">القائد: <b class="text-fantasy-accent">صلاح (C)</b></span>
                            <span class="bg-fantasy-surface px-3 py-1 rounded-full text-gray-300">نائب القائد: <b class="text-fantasy-cyan">هالاند (V)</b></span>
                        </div>
                    </div>

                    <!-- Pitch Visualizer -->
                    <div class="pitch-bg w-full aspect-[4/5] sm:aspect-[4/3] max-w-2xl flex flex-col justify-between py-6 px-2 relative">
                        <div class="pitch-lines">
                            <div class="center-circle"></div>
                            <div class="absolute top-1/2 left-0 right-0 h-0.5 bg-white/20"></div>
                            <div class="penalty-area-top"></div>
                            <div class="penalty-area-bottom"></div>
                        </div>

                        <!-- Goalkeeper Line -->
                        <div class="flex justify-center items-center z-10">
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('حارس المرمى', 'الشناوي', 7)">
                                <div class="w-12 h-12 sm:w-14 sm:h-14 bg-gradient-to-b from-yellow-500 to-amber-700 rounded-full mx-auto border-2 border-white flex items-center justify-center text-xl shadow-lg relative">
                                    🧤
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-accent text-[10px] px-1.5 py-0.5 rounded-full font-bold">7pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">الشناوي</div>
                                <div class="text-[10px] text-gray-300 bg-black/60 rounded px-1 mt-0.5">الأهلي</div>
                            </div>
                        </div>

                        <!-- Defenders Line -->
                        <div class="flex justify-around items-center z-10 px-2">
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('مدافع', 'معلول', 6)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-red-600 to-red-900 rounded-full mx-auto border-2 border-white flex items-center justify-center text-lg shadow-lg relative">
                                    🏃
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-accent text-[10px] px-1.5 py-0.5 rounded-full font-bold">6pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">معلول</div>
                            </div>
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('مدافع', 'عبد المنعم', 8)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-red-600 to-red-900 rounded-full mx-auto border-2 border-white flex items-center justify-center text-lg shadow-lg relative">
                                    🛡️
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-accent text-[10px] px-1.5 py-0.5 rounded-full font-bold">8pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">عبد المنعم</div>
                            </div>
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('مدافع', 'فتوح', 2)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-white to-gray-300 text-black rounded-full mx-auto border-2 border-purple-900 flex items-center justify-center text-lg shadow-lg relative">
                                    🏃
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-pink text-[10px] px-1.5 py-0.5 rounded-full font-bold">2pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">فتوح</div>
                            </div>
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('مدافع', 'عمر كمال', 5)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-blue-600 to-blue-900 rounded-full mx-auto border-2 border-white flex items-center justify-center text-lg shadow-lg relative">
                                    🛡️
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-accent text-[10px] px-1.5 py-0.5 rounded-full font-bold">5pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">عمر كمال</div>
                            </div>
                        </div>

                        <!-- Midfielders Line -->
                        <div class="flex justify-around items-center z-10 px-6">
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('وسط', 'زيزو', 11)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-white to-gray-300 text-black rounded-full mx-auto border-2 border-purple-900 flex items-center justify-center text-lg shadow-lg relative">
                                    ⚽
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-accent text-[10px] px-1.5 py-0.5 rounded-full font-bold">11pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">زيزو</div>
                            </div>
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('وسط', 'إمام عاشور', 9)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-red-600 to-red-900 rounded-full mx-auto border-2 border-white flex items-center justify-center text-lg shadow-lg relative">
                                    ⚡
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-accent text-[10px] px-1.5 py-0.5 rounded-full font-bold">9pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">إمام عاشور</div>
                            </div>
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('وسط', 'بن شرقي', 4)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-blue-600 to-blue-900 rounded-full mx-auto border-2 border-white flex items-center justify-center text-lg shadow-lg relative">
                                    🎯
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-cyan text-[10px] px-1.5 py-0.5 rounded-full font-bold">4pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">بن شرقي</div>
                            </div>
                        </div>

                        <!-- Forwards Line -->
                        <div class="flex justify-around items-center z-10 px-4">
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('مهاجم', 'صلاح (C)', 16)">
                                <div class="w-11 h-11 sm:w-14 sm:h-14 bg-gradient-to-b from-red-700 to-red-950 rounded-full mx-auto border-2 border-fantasy-accent flex items-center justify-center text-xl shadow-lg relative glow-effect">
                                    👑
                                    <span class="absolute -top-2 -right-1 bg-fantasy-accent text-black text-[11px] px-1.5 py-0.5 rounded-full font-black">16pt</span>
                                    <span class="absolute -bottom-1 bg-fantasy-accent text-black font-black text-[9px] px-1 rounded">C</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-fantasy-accent text-fantasy-accent text-xs font-black px-2 py-0.5 rounded mt-1 shadow">محمد صلاح</div>
                            </div>
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('مهاجم', 'مروان حمدي', 2)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-green-600 to-green-900 rounded-full mx-auto border-2 border-white flex items-center justify-center text-lg shadow-lg relative">
                                    ⚽
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-pink text-[10px] px-1.5 py-0.5 rounded-full font-bold">2pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">مروان حمدي</div>
                            </div>
                            <div class="player-card text-center cursor-pointer transform hover:scale-105 transition" onclick="selectPlayer('مهاجم', 'مصطفى محمد', 7)">
                                <div class="w-10 h-10 sm:w-12 sm:h-12 bg-gradient-to-b from-amber-600 to-amber-900 rounded-full mx-auto border-2 border-white flex items-center justify-center text-lg shadow-lg relative">
                                    🔥
                                    <span class="absolute -top-1 -right-1 bg-black/80 text-fantasy-accent text-[10px] px-1.5 py-0.5 rounded-full font-bold">7pt</span>
                                </div>
                                <div class="bg-fantasy-card/95 border border-purple-900 text-white text-xs font-bold px-2 py-0.5 rounded mt-1 shadow">مصطفى محمد</div>
                            </div>
                        </div>
                    </div>

                    <!-- Substitutes Bench -->
                    <div class="w-full mt-4 bg-fantasy-bg p-3 rounded-xl border border-purple-900/40">
                        <div class="text-xs text-gray-400 font-bold mb-2 flex items-center gap-2">
                            <i class="fa-solid fa-chair text-fantasy-pink"></i>
                            دكة الاحتياط
                        </div>
                        <div class="grid grid-cols-4 gap-2 text-center">
                            <div class="bg-fantasy-card p-2 rounded-lg border border-purple-900/30 text-xs">
                                <div class="text-gray-400 text-[10px]">حارس 2</div>
                                <div class="font-bold text-white">عواد</div>
                                <div class="text-fantasy-accent text-[10px]">0 pt</div>
                            </div>
                            <div class="bg-fantasy-card p-2 rounded-lg border border-purple-900/30 text-xs">
                                <div class="text-gray-400 text-[10px]">مدافع 5</div>
                                <div class="font-bold text-white">بااهر</div>
                                <div class="text-fantasy-accent text-[10px]">1 pt</div>
                            </div>
                            <div class="bg-fantasy-card p-2 rounded-lg border border-purple-900/30 text-xs">
                                <div class="text-gray-400 text-[10px]">وسط 4</div>
                                <div class="font-bold text-white">السولية</div>
                                <div class="text-fantasy-accent text-[10px]">2 pt</div>
                            </div>
                            <div class="bg-fantasy-card p-2 rounded-lg border border-purple-900/30 text-xs">
                                <div class="text-gray-400 text-[10px]">مهاجم 4</div>
                                <div class="font-bold text-white">أوجولا</div>
                                <div class="text-fantasy-accent text-[10px]">0 pt</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Sidebar: Chips & Selected Player Details -->
                <div class="lg:col-span-4 space-y-6">
                    <!-- Special Chips (الخواص) -->
                    <div class="bg-fantasy-card p-5 rounded-2xl border border-purple-900/40">
                        <h3 class="font-bold text-lg text-white mb-4 flex items-center gap-2">
                            <i class="fa-solid fa-bolt text-yellow-400"></i>
                            الخواص المتاحة (Chips)
                        </h3>
                        <div class="grid grid-cols-2 gap-3">
                            <button onclick="useChip('الوايلد كارد')" class="p-3 bg-fantasy-surface hover:bg-purple-900/60 border border-purple-800 rounded-xl text-right transition flex flex-col justify-between">
                                <span class="text-xs text-gray-400 font-semibold">Wildcard</span>
                                <span class="font-bold text-fantasy-accent text-sm mt-1">الوايلد كارد</span>
                                <span class="text-[10px] text-green-400 mt-2">متاح للإنقاذ</span>
                            </button>
                            <button onclick="useChip('الربان الثلاثي')" class="p-3 bg-fantasy-surface hover:bg-purple-900/60 border border-purple-800 rounded-xl text-right transition flex flex-col justify-between">
                                <span class="text-xs text-gray-400 font-semibold">Triple Captain</span>
                                <span class="font-bold text-fantasy-cyan text-sm mt-1">الكابتن الثلاثي</span>
                                <span class="text-[10px] text-green-400 mt-2">متاح</span>
                            </button>
                            <button onclick="useChip('تعزيز الدكة')" class="p-3 bg-fantasy-surface hover:bg-purple-900/60 border border-purple-800 rounded-xl text-right transition flex flex-col justify-between">
                                <span class="text-xs text-gray-400 font-semibold">Bench Boost</span>
                                <span class="font-bold text-white text-sm mt-1">تعزيز الدكة</span>
                                <span class="text-[10px] text-green-400 mt-2">متاح</span>
                            </button>
                            <div class="p-3 bg-fantasy-surface/40 border border-purple-900/30 rounded-xl text-right opacity-60">
                                <span class="text-xs text-gray-500 font-semibold">Free Hit</span>
                                <span class="font-bold text-gray-400 text-sm mt-1">التبديل المجاني</span>
                                <span class="text-[10px] text-red-400 mt-2">تم استخدامها</span>
                            </div>
                        </div>
                    </div>

                    <!-- Interactive Player Inspector Panel -->
                    <div class="bg-fantasy-card p-5 rounded-2xl border border-purple-900/40" id="player-inspector">
                        <h3 class="font-bold text-lg text-white mb-2 flex items-center gap-2">
                            <i class="fa-solid fa-circle-info text-fantasy-cyan"></i>
                            تفاصيل اللاعب
                        </h3>
                        <p class="text-xs text-gray-400 mb-4">اضغط على أي لاعب في الملعب لعرض التفاصيل وإدارته</p>
                        
                        <div id="inspector-content" class="bg-fantasy-bg p-4 rounded-xl border border-purple-900/50 text-center py-8">
                            <i class="fa-solid fa-hand-pointer text-3xl text-purple-800 mb-2"></i>
                            <div class="text-sm text-gray-400">قم باختيار لاعب من التشكيلة أعلاه</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- ==================== TAB 2: TRANSFERS MARKET ==================== -->
        <div id="tab-transfers" class="hidden space-y-6">
            <div class="bg-fantasy-card p-6 rounded-2xl border border-purple-900/40">
                <div class="flex flex-wrap justify-between items-center gap-4 mb-6">
                    <div>
                        <h2 class="text-2xl font-black text-white">سوق الانتقالات (Transfers)</h2>
                        <p class="text-xs text-gray-400">اختر اللاعبين بعناية ولا تتجاوز الميزانية المحددة</p>
                    </div>
                    <div class="flex gap-4">
                        <div class="bg-fantasy-bg px-4 py-2 rounded-xl border border-purple-900">
                            <span class="text-xs text-gray-400 block">الميزانية المتبقية</span>
                            <span class="text-xl font-black text-fantasy-accent" id="budget-display">£ 3.5m</span>
                        </div>
                        <div class="bg-fantasy-bg px-4 py-2 rounded-xl border border-purple-900">
                            <span class="text-xs text-gray-400 block">التبديلات المجانية</span>
                            <span class="text-xl font-black text-fantasy-cyan">1 مجاني</span>
                        </div>
                    </div>
                </div>

                <!-- Filters -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-3 mb-6">
                    <input type="text" id="search-player" onkeyup="filterTransfers()" placeholder="بحث باسم اللاعب..." class="bg-fantasy-bg border border-purple-900/60 rounded-xl px-4 py-2 text-sm text-white focus:outline-none focus:border-fantasy-accent">
                    <select id="filter-position" onchange="filterTransfers()" class="bg-fantasy-bg border border-purple-900/60 rounded-xl px-4 py-2 text-sm text-white focus:outline-none focus:border-fantasy-accent">
                        <option value="ALL">جميع المراكز</option>
                        <option value="GKP">حارس مرمى</option>
                        <option value="DEF">مدافع</option>
                        <option value="MID">لاعب وسط</option>
                        <option value="FWD">مهاجم</option>
                    </select>
                    <select id="sort-by" onchange="filterTransfers()" class="bg-fantasy-bg border border-purple-900/60 rounded-xl px-4 py-2 text-sm text-white focus:outline-none focus:border-fantasy-accent">
                        <option value="points">الأعلى نقاطاً</option>
                        <option value="price">الأعلى سعراً</option>
                    </select>
                </div>

                <!-- Transfer Players Table -->
                <div class="overflow-x-auto">
                    <table class="w-full text-right text-sm">
                        <thead class="bg-fantasy-bg text-gray-400 border-b border-purple-900/60">
                            <tr>
                                <th class="p-3">اللاعب</th>
                                <th class="p-3">المركز</th>
                                <th class="p-3">الفريق</th>
                                <th class="p-3">السعر</th>
                                <th class="p-3">إجمالي النقاط</th>
                                <th class="p-3">الإجراء</th>
                            </tr>
                        </thead>
                        <tbody id="transfer-table-body" class="divide-y divide-purple-900/30">
                            <!-- Populated dynamically via JS -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- ==================== TAB 3: STANDINGS / LEADERBOARD ==================== -->
        <div id="tab-standings" class="hidden space-y-6">
            <div class="bg-fantasy-card p-6 rounded-2xl border border-purple-900/40">
                <div class="flex justify-between items-center mb-6">
                    <div>
                        <h2 class="text-2xl font-black text-white">جدول ترتيب دوري الصبخاية</h2>
                        <p class="text-xs text-gray-400">التحديث المباشر بعد كل مباراة</p>
                    </div>
                    <span class="bg-fantasy-accent/10 border border-fantasy-accent text-fantasy-accent text-xs font-bold px-3 py-1 rounded-full">
                        دوري خاص مغلق
                    </span>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-right text-sm">
                        <thead class="bg-fantasy-bg text-gray-400 border-b border-purple-900/60">
                            <tr>
                                <th class="p-3">الترتيب</th>
                                <th class="p-3">الفريق والمدرب</th>
                                <th class="p-3">نقاط الجولة</th>
                                <th class="p-3">إجمالي النقاط</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-purple-900/30">
                            <tr class="hover:bg-purple-900/20 transition">
                                <td class="p-3 font-bold text-yellow-400">🥇 1</td>
                                <td class="p-3">
                                    <div class="font-bold text-white">الفرسان الذهبية</div>
                                    <div class="text-xs text-gray-400">أحمد الصبخاوي</div>
                                </td>
                                <td class="p-3 text-fantasy-accent font-bold">74</td>
                                <td class="p-3 font-black text-white">880</td>
                            </tr>
                            <tr class="hover:bg-purple-900/20 transition">
                                <td class="p-3 font-bold text-gray-300">🥈 2</td>
                                <td class="p-3">
                                    <div class="font-bold text-white">ملوك التكتيك</div>
                                    <div class="text-xs text-gray-400">محمود العراقي</div>
                                </td>
                                <td class="p-3 text-fantasy-accent font-bold">69</td>
                                <td class="p-3 font-black text-white">855</td>
                            </tr>
                            <tr class="bg-fantasy-accent/10 hover:bg-fantasy-accent/20 transition border-l-4 border-fantasy-accent">
                                <td class="p-3 font-bold text-fantasy-accent">🥉 3 (فريقك)</td>
                                <td class="p-3">
                                    <div class="font-bold text-fantasy-accent">صقور الصبخاية</div>
                                    <div class="text-xs text-gray-300">علي الكابتن</div>
                                </td>
                                <td class="p-3 text-fantasy-accent font-bold">68</td>
                                <td class="p-3 font-black text-white">842</td>
                            </tr>
                            <tr class="hover:bg-purple-900/20 transition">
                                <td class="p-3 font-bold text-gray-400">4</td>
                                <td class="p-3">
                                    <div class="font-bold text-white">نجوم الليل</div>
                                    <div class="text-xs text-gray-400">حسن طاهر</div>
                                </td>
                                <td class="p-3 text-fantasy-accent font-bold">52</td>
                                <td class="p-3 font-black text-white">790</td>
                            </tr>
                            <tr class="hover:bg-purple-900/20 transition">
                                <td class="p-3 font-bold text-gray-400">5</td>
                                <td class="p-3">
                                    <div class="font-bold text-white">المدفعجية</div>
                                    <div class="text-xs text-gray-400">كرار حسين</div>
                                </td>
                                <td class="p-3 text-fantasy-accent font-bold">61</td>
                                <td class="p-3 font-black text-white">775</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- ==================== TAB 4: FIXTURES ==================== -->
        <div id="tab-fixtures" class="hidden space-y-6">
            <div class="bg-fantasy-card p-6 rounded-2xl border border-purple-900/40">
                <h2 class="text-2xl font-black text-white mb-6">مباريات الجولة 14</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="bg-fantasy-bg p-4 rounded-xl border border-purple-900/50 flex justify-between items-center">
                        <div class="font-bold text-white">الأهلي</div>
                        <div class="bg-fantasy-surface px-4 py-1 rounded-lg text-fantasy-accent font-black">2 - 1</div>
                        <div class="font-bold text-white">الزمالك</div>
                    </div>
                    <div class="bg-fantasy-bg p-4 rounded-xl border border-purple-900/50 flex justify-between items-center">
                        <div class="font-bold text-white">بيراميدز</div>
                        <div class="bg-fantasy-surface px-4 py-1 rounded-lg text-fantasy-cyan font-black">1 - 1</div>
                        <div class="font-bold text-white">المصري</div>
                    </div>
                    <div class="bg-fantasy-bg p-4 rounded-xl border border-purple-900/50 flex justify-between items-center">
                        <div class="font-bold text-white">الاتحاد</div>
                        <div class="bg-fantasy-surface px-3 py-1 rounded-lg text-gray-400 text-xs">الجمعة 8:00 م</div>
                        <div class="font-bold text-white">الإسماعيلي</div>
                    </div>
                    <div class="bg-fantasy-bg p-4 rounded-xl border border-purple-900/50 flex justify-between items-center">
                        <div class="font-bold text-white">سيراميكا</div>
                        <div class="bg-fantasy-surface px-3 py-1 rounded-lg text-gray-400 text-xs">السبت 6:00 م</div>
                        <div class="font-bold text-white">سموحة</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ==================== TAB 5: FLUTTER CODE VIEWER ==================== -->
        <div id="tab-flutter-code" class="hidden space-y-6">
            <div class="bg-fantasy-card p-6 rounded-2xl border border-purple-900/40">
                <div class="flex flex-wrap justify-between items-center gap-4 mb-4">
                    <div>
                        <h2 class="text-2xl font-black text-fantasy-cyan flex items-center gap-2">
                            <i class="fa-solid fa-code"></i>
                            كود Flutter لتطبيق "فانتازي الصبخاية"
                        </h2>
                        <p class="text-xs text-gray-400">كود Dart كامل جاهز للنسخ والتشغيل في بيئة Flutter الخاصة بك</p>
                    </div>
                    <button onclick="copyFlutterCode()" class="bg-fantasy-accent text-black font-black px-5 py-2.5 rounded-xl hover:bg-green-400 transition flex items-center gap-2 shadow-lg">
                        <i class="fa-solid fa-copy"></i>
                        <span>نسخ الكود الكامل</span>
                    </button>
                </div>

                <!-- Code View Container -->
                <div class="relative bg-[#0d0714] p-4 rounded-xl border border-purple-900/80 font-mono text-xs text-green-400 overflow-x-auto max-h-[600px]">
                    <pre id="flutter-code-text"><code>// ========================================================
// تطبيق فانتازي الصبخاية - Fantasy Al-Sebkhaya App in Flutter
// File: lib/main.dart
// ========================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const SebkhayaFantasyApp());
}

class SebkhayaFantasyApp extends StatelessWidget {
  const SebkhayaFantasyApp({Super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'فانتازي الصبخاية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F051D),
        primaryColor: const Color(0xFF00FF87),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FF87),
          secondary: Color(0xFF02EFFF),
          surface: Color(0xFF1D0C36),
        ),
      ),
      home: const MainDashboardScreen(),
    );
  }
}

// --------------------------------------------------------
// Main Dashboard & Pitch Screen
// --------------------------------------------------------
class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({Super.key});

  @override
  State&lt;MainDashboardScreen&gt; createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State&lt;MainDashboardScreen&gt; {
  int _selectedIndex = 0;

  final List&lt;Widget&gt; _screens = [
    const PitchViewTab(),
    const TransfersTab(),
    const StandingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D0C36),
        title: const Text(
          'فانتازي الصبخاية',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF00FF87)),
            onPressed: () {},
          )
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF1D0C36),
        selectedItemColor: const Color(0xFF00FF87),
        unselectedItemColor: Colors.gray,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'التشكيلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'الانتقالات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'الترتيب',
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------
// Football Pitch Widget
// --------------------------------------------------------
class PitchViewTab extends StatelessWidget {
  const PitchViewTab({Super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // GW Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1D0C36),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('الجولة 14', style: TextStyle(color: Colors.gray, fontSize: 12)),
                    Text('68 نقطة', style: TextStyle(color: Color(0xFF00FF87), fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00FF87)),
                  onPressed: () {},
                  child: const Text('تفعيل الخواص', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          // Green Pitch UI
          Container(
            height: 450,
            decoration: BoxDecoration(
              color: const Color(0xFF164026),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white24, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Goalkeeper
                _buildPlayerBadge('الشناوي', '7 pt', true),
                // Defenders
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPlayerBadge('معلول', '6 pt', false),
                    _buildPlayerBadge('عبد المنعم', '8 pt', false),
                    _buildPlayerBadge('فتوح', '2 pt', false),
                    _buildPlayerBadge('عمر كمال', '5 pt', false),
                  ],
                ),
                // Midfielders
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPlayerBadge('زيزو', '11 pt', false),
                    _buildPlayerBadge('إمام', '9 pt', false),
                    _buildPlayerBadge('بن شرقي', '4 pt', false),
                  ],
                ),
                // Forwards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPlayerBadge('صلاح (C)', '16 pt', false, isCaptain: true),
                    _buildPlayerBadge('مروان', '2 pt', false),
                    _buildPlayerBadge('مصطفى', '7 pt', false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerBadge(String name, String pts, bool isGk, {bool isCaptain = false}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isCaptain ? const Color(0xFF00FF87) : (isGk ? Colors.amber : Colors.redAccent),
          radius: 20,
          child: Text(isCaptain ? 'C' : '⚽', style: const TextStyle(fontSize: 14)),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              Text(pts, style: const TextStyle(color: Color(0xFF00FF87), fontSize: 9)),
            ],
          ),
        )
      ],
    );
  }
}

// Dummy Tabs for Transfers and Standings
class TransfersTab extends StatelessWidget {
  const TransfersTab({Super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('سوق الانتقالات'));
}

class StandingsTab extends StatelessWidget {
  const StandingsTab({Super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('جدول ترتيب الترتيب العام'));
}
</code></pre>
                </div>
            </div>
        </div>

    </main>

    <!-- Notification Toast -->
    <div id="toast" class="fixed bottom-5 left-5 bg-fantasy-accent text-black font-bold px-4 py-3 rounded-xl shadow-2xl transition transform translate-y-20 opacity-0 z-50 flex items-center gap-2">
        <i class="fa-solid fa-circle-check"></i>
        <span id="toast-message">تمت العملية بنجاح!</span>
    </div>

    <!-- Footer -->
    <footer class="bg-fantasy-card/80 border-t border-purple-900/40 py-4 text-center text-xs text-gray-500">
        فانتازي الصبخاية &copy; 2026 - جميع الحقوق محفوظة لعشاق الكرة.
    </footer>

    <!-- Interactive JavaScript Application Logic -->
    <script>
        // Sample Transfers Data
        const availablePlayers = [
            { name: 'محمد صلاح', team: 'الأهلي', pos: 'FWD', price: 12.5, points: 112 },
            { name: 'أحمد سيد زيزو', team: 'الزمالك', pos: 'MID', price: 10.5, points: 98 },
            { name: 'إمام عاشور', team: 'الأهلي', pos: 'MID', price: 9.0, points: 85 },
            { name: 'محمد الشناوي', team: 'الأهلي', pos: 'GKP', price: 5.5, points: 64 },
            { name: 'مصطفى فتحي', team: 'بيراميدز', pos: 'MID', price: 8.5, points: 72 },
            { name: 'علي معلول', team: 'الأهلي', pos: 'DEF', price: 6.0, points: 58 },
            { name: 'أحمد فتوح', team: 'الزمالك', pos: 'DEF', price: 5.5, points: 45 },
            { name: 'مروان حمدي', team: 'المصري', pos: 'FWD', price: 7.0, points: 52 },
        ];

        // Switch Tabs Function
        function switchTab(tabId) {
            const tabs = ['dashboard', 'transfers', 'standings', 'fixtures', 'flutter-code'];
            tabs.forEach(t => {
                document.getElementById(`tab-${t}`).classList.add('hidden');
                const btn = document.getElementById(`tab-btn-${t}`);
                if (btn) {
                    btn.classList.remove('text-fantasy-accent', 'bg-fantasy-surface', 'shadow');
                    btn.classList.add('text-gray-400');
                }
            });

            document.getElementById(`tab-${tabId}`).classList.remove('hidden');
            const activeBtn = document.getElementById(`tab-btn-${tabId}`);
            if (activeBtn) {
                activeBtn.classList.add('text-fantasy-accent', 'bg-fantasy-surface', 'shadow');
                activeBtn.classList.remove('text-gray-400');
            }

            if(tabId === 'transfers') {
                renderTransfers();
            }
        }

        // Select Player for Details in Dashboard
        function selectPlayer(pos, name, pts) {
            const inspector = document.getElementById('inspector-content');
            inspector.innerHTML = `
                <div class="space-y-3">
                    <div class="w-16 h-16 bg-gradient-to-tr from-purple-600 to-fantasy-accent rounded-full mx-auto flex items-center justify-center text-2xl font-black text-black">
                        ⚽
                    </div>
                    <div>
                        <div class="text-xl font-black text-white">${name}</div>
                        <div class="text-xs text-fantasy-accent">${pos} - نقاط الجولة: ${pts} pt</div>
                    </div>
                    <div class="pt-2 flex justify-center gap-2">
                        <button onclick="showToast('تم تعيين ${name} ككابتن للفريق!')" class="bg-fantasy-accent text-black font-bold text-xs px-3 py-1.5 rounded-lg hover:bg-green-400">
                            جعله كابتن (C)
                        </button>
                        <button onclick="showToast('تمت إضافة ${name} لقائمة التبديل')" class="bg-fantasy-surface text-white font-bold text-xs px-3 py-1.5 rounded-lg border border-purple-800">
                            تبديل
                        </button>
                    </div>
                </div>
            `;
        }

        // Chips Action
        function useChip(chipName) {
            showToast(`تم تفعيل خاصية (${chipName}) بنجاح للجولة القادمة!`);
        }

        // Render Transfers Table
        function renderTransfers() {
            const tbody = document.getElementById('transfer-table-body');
            const search = document.getElementById('search-player').value.toLowerCase();
            const pos = document.getElementById('filter-position').value;

            let filtered = availablePlayers.filter(p => {
                const matchesName = p.name.toLowerCase().includes(search);
                const matchesPos = pos === 'ALL' || p.pos === pos;
                return matchesName && matchesPos;
            });

            tbody.innerHTML = filtered.map(p => `
                <tr class="hover:bg-purple-900/20 transition">
                    <td class="p-3 font-bold text-white">${p.name}</td>
                    <td class="p-3 text-xs"><span class="bg-fantasy-surface px-2 py-0.5 rounded text-fantasy-cyan">${p.pos}</span></td>
                    <td class="p-3 text-gray-300">${p.team}</td>
                    <td class="p-3 font-bold text-fantasy-accent">£${p.price.toFixed(1)}m</td>
                    <td class="p-3 font-bold text-white">${p.points}</td>
                    <td class="p-3">
                        <button onclick="buyPlayer('${p.name}', ${p.price})" class="bg-fantasy-accent text-black font-bold text-xs px-3 py-1 rounded hover:bg-green-400 transition">
                            شراء +
                        </button>
                    </td>
                </tr>
            `).join('');
        }

        function filterTransfers() {
            renderTransfers();
        }

        function buyPlayer(name, price) {
            showToast(`تمت إضافة ${name} إلى فريقك بسعر £${price}m`);
        }

        // Toast Helper
        function showToast(msg) {
            const toast = document.getElementById('toast');
            const toastMsg = document.getElementById('toast-message');
            toastMsg.innerText = msg;
            toast.classList.remove('translate-y-20', 'opacity-0');
            setTimeout(() => {
                toast.classList.add('translate-y-20', 'opacity-0');
            }, 3000);
        }

        // Copy Flutter Source Code
        function copyFlutterCode() {
            const codeText = document.getElementById('flutter-code-text').innerText;
            const textarea = document.createElement('textarea');
            textarea.value = codeText;
            document.body.appendChild(textarea);
            textarea.select();
            document.execCommand('copy');
            document.body.removeChild(textarea);
            showToast('تم نسخ كود Flutter إلى الحافظة بنجاح!');
        }
    </script>
</body>
</html>