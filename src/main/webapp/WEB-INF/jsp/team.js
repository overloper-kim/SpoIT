/*팀별 페이지 스크립트*/
const teams = {
  samsung: {
    name: '삼성 라이온즈',
    color: '#005BAC',
    games: [
      { date: '2024-06-24', time: '18:30', home: true, opponent: 'ssg', location: '대구삼성라이온즈파크', reserveUrl: '#' },
      { date: '2024-06-25', time: '18:30', home: true, opponent: 'hanwha', location: '대구삼성라이온즈파크', reserveUrl: '#' },
      { date: '2024-06-30', time: '18:30', home: true, opponent: 'hanwha', location: '대구삼성라이온즈파크', reserveUrl: '#' }
    ]
  },
  ssg: {
    name: 'SSG 랜더스',
    color: '#E61A23',
    games: [
      { date: '2024-06-26', time: '18:30', home: true, opponent: 'samsung', location: '인천SSG랜더스필드', reserveUrl: '#' },
      { date: '2024-06-27', time: '18:30', home: true, opponent: 'hanwha', location: '인천SSG랜더스필드', reserveUrl: '#' },
      { date: '2024-06-28', time: '18:30', home: true, opponent: 'samsung', location: '인천SSG랜더스필드', reserveUrl: '#' }
    ]
  },
  hanwha: {
    name: '한화 이글스',
    color: '#FF6600',
    games: [
      { date: '2024-06-28', time: '18:30', home: true, opponent: 'samsung', location: '대전한화생명이글스파크', reserveUrl: '#' },
      { date: '2024-06-29', time: '18:30', home: true, opponent: 'ssg', location: '대전한화생명이글스파크', reserveUrl: '#' },
      { date: '2024-07-01', time: '18:30', home: true, opponent: 'ssg', location: '대전한화생명이글스파크', reserveUrl: '#' }
    ]
  },
  seoul: {
    name: 'FC 서울',
    color: '#C60C30',
    games: [
      { date: '2024-07-01', time: '19:00', home: true, opponent: 'jeonbuk', location: '서울월드컵경기장', reserveUrl: '#' },
      { date: '2024-07-05', time: '19:00', home: true, opponent: 'ulsan', location: '서울월드컵경기장', reserveUrl: '#' },
      { date: '2024-07-10', time: '19:00', home: true, opponent: 'jeonbuk', location: '서울월드컵경기장', reserveUrl: '#' }
    ]
  },
  jeonbuk: {
    name: '전북 현대 모터스',
    color: '#006400',
    games: [
      { date: '2024-07-02', time: '19:00', home: true, opponent: 'seoul', location: '전주월드컵경기장', reserveUrl: '#' },
      { date: '2024-07-06', time: '19:00', home: true, opponent: 'ulsan', location: '전주월드컵경기장', reserveUrl: '#' },
      { date: '2024-07-11', time: '19:00', home: true, opponent: 'seoul', location: '전주월드컵경기장', reserveUrl: '#' }
    ]
  },
  ulsan: {
    name: '울산 현대',
    color: '#1D2088',
    games: [
      { date: '2024-07-03', time: '19:00', home: true, opponent: 'seoul', location: '울산문수축구경기장', reserveUrl: '#' },
      { date: '2024-07-07', time: '19:00', home: true, opponent: 'jeonbuk', location: '울산문수축구경기장', reserveUrl: '#' },
      { date: '2024-07-12', time: '19:00', home: true, opponent: 'jeonbuk', location: '울산문수축구경기장', reserveUrl: '#' }
    ]
  },
  sk: {
    name: '서울 SK 나이츠',
    color: '#E6002D',
    games: [
      { date: '2024-07-10', time: '19:00', home: true, opponent: 'lg', location: '잠실학생체육관', reserveUrl: '#' },
      { date: '2024-07-12', time: '19:00', home: true, opponent: 'sono', location: '잠실학생체육관', reserveUrl: '#' },
      { date: '2024-07-15', time: '19:00', home: true, opponent: 'sono', location: '잠실학생체육관', reserveUrl: '#' }
    ]
  },
  lg: {
    name: '창원 LG 세이커스',
    color: '#1D428A',
    games: [
      { date: '2024-07-11', time: '19:00', home: true, opponent: 'sk', location: '창원실내체육관', reserveUrl: '#' },
      { date: '2024-07-13', time: '19:00', home: true, opponent: 'sono', location: '창원실내체육관', reserveUrl: '#' },
      { date: '2024-07-16', time: '19:00', home: true, opponent: 'sk', location: '창원실내체육관', reserveUrl: '#' }
    ]
  },
  sono: {
    name: '고양 소노 스카이거스',
    color: '#0099D8',
    games: [
      { date: '2024-07-14', time: '19:00', home: true, opponent: 'sk', location: '고양체육관', reserveUrl: '#' },
      { date: '2024-07-15', time: '19:00', home: true, opponent: 'lg', location: '고양체육관', reserveUrl: '#' },
      { date: '2024-07-18', time: '19:00', home: true, opponent: 'lg', location: '고양체육관', reserveUrl: '#' }
    ]
  }
};

function getTeamKey() {
  const params = new URLSearchParams(window.location.search);
  return params.get('team');
}

function renderTeamPage() {
  const teamKey = getTeamKey();
  const team = teams[teamKey];
  if (!team) return;

  // 로고 경로 자동 매핑
  const logoPath = 'logos/' + teamKey + '.png';

  // 팀 배너 적용
  const banner = document.getElementById('team-banner');
  if (banner) banner.style.background = team.color;
  const logo = document.getElementById('team-logo');
  if (logo) logo.src = logoPath;
  const name = document.getElementById('team-name');
  if (name) name.textContent = team.name;

  // 예매하기 메뉴 컬러 동기화
  const reserveMenu = document.getElementById('reserve-menu-title');
  if (reserveMenu) reserveMenu.style.borderLeft = `4px solid ${team.color}`;

  // 경기 정보 리스트 생성
  const gameInfo = document.getElementById('game-info');
  if (gameInfo) {
    let html = '';
    team.games.forEach(game => {
      const opponent = teams[game.opponent];
      const opponentLogoPath = 'logos/' + game.opponent + '.png';
      html += `<div class=\"team-game-card\">
        <div class=\"team-game-date\">
          <div>${game.date}</div>
          <div style='font-size:0.95em;color:#888;'>${game.time}</div>
        </div>
        <div class=\"team-game-teams\">
          <img class=\"team-game-team-logo\" src=\"${logoPath}\" alt=\"${team.name}\" />
          <span>${team.name}</span>
          <span class=\"team-game-vs\">vs</span>
          <img class=\"team-game-team-logo\" src=\"${opponentLogoPath}\" alt=\"${opponent.name}\" />
          <span>${opponent.name}</span>
        </div>
        <div class=\"team-game-location\">${game.location}</div>
        <button class=\"team-reserve-btn\" onclick=\"window.open('${game.reserveUrl}','_blank')\">예매하기</button>
      </div>`;
    });
    gameInfo.innerHTML = html;
  }
}

document.addEventListener('DOMContentLoaded', renderTeamPage);