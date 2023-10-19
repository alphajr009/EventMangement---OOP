let activeTab = "Places";
openTab(activeTab);

function openTab(tabName) {
	const tabContents = document.querySelectorAll('.tab-content');
	tabContents.forEach(content => content.style.display = 'none');

	const tabLinks = document.querySelectorAll('.tablinks');
	tabLinks.forEach(link => link.classList.remove('active'));

	document.getElementById(tabName).style.display = 'block';

	const activeButton = document.querySelector(`.tab button[onclick="openTab('${tabName}')"]`);
	activeButton.classList.add('active');

	activeTab = tabName;
}


let activeTabPlaces = "PlacesHistory";
openTabPlaces(activeTabPlaces);

function openTabPlaces(tabName) {
	const tabContents = document.querySelectorAll('.tab-content-places');
	tabContents.forEach(content => content.style.display = 'none');

	const tabLinks = document.querySelectorAll('.tablinksplaces');
	tabLinks.forEach(link => link.classList.remove('activeplace'));

	document.getElementById(tabName).style.display = 'block';

	const activeButton = document.querySelector(`.tabplaces button[onclick="openTabPlaces('${tabName}')"]`);
	activeButton.classList.add('activeplace');

	activeTabPlaces = tabName;
}




let activeTabDeco = "DecoHistory";
openTabDeco(activeTabDeco);

function openTabDeco(tabName) {
	const tabContents = document.querySelectorAll('.tab-content-deco');
	tabContents.forEach(content => content.style.display = 'none');

	const tabLinks = document.querySelectorAll('.tablinksdeco');
	tabLinks.forEach(link => link.classList.remove('activedeco'));

	document.getElementById(tabName).style.display = 'block';

	const activeButton = document.querySelector(`.tabdeco button[onclick="openTabDeco('${tabName}')"]`);
	activeButton.classList.add('activedeco');

	activeTabDeco = tabName;
}



let activeTabCat = "CatHistory";
openTabCat(activeTabCat);

function openTabCat(tabName) {
	const tabContents = document.querySelectorAll('.tab-content-cat');
	tabContents.forEach(content => content.style.display = 'none');

	const tabLinks = document.querySelectorAll('.tablinkscat');
	tabLinks.forEach(link => link.classList.remove('activecat'));

	document.getElementById(tabName).style.display = 'block';

	const activeButton = document.querySelector(`.tabcat button[onclick="openTabCat('${tabName}')"]`);
	activeButton.classList.add('activecat');

	activeTabCat = tabName;
}










