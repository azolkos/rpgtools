function updateHitbox(id) {
    var elem = document.getElementById(id);
    var sorting = id.split('_');
    if (id == 'wound_0_1' && elem.style.backgroundColor == 'red' && document.getElementById('wound_0_2').style.backgroundColor == '') {
        elem.style.backgroundColor = '';
        return;
    }
    for (let i=0; i >= Number(sorting[1]); i--) {
        document.getElementById('wound_'+i).style.backgroundColor = 'red';
        for (let j=1; j <= 4; j++) {
            if (i == Number(sorting[1]) && j > Number(sorting[2])) {
            } else {
                document.getElementById('wound_'+i+'_'+j).style.backgroundColor = 'red';
            }
        }
    }
    for (let i=Number(sorting[1]); i >= -9; i--) {
        document.getElementById('wound_'+i).style.backgroundColor = '';
        for (let j=1; j <= 4; j++) {
            if (i == Number(sorting[1]) && j <= Number(sorting[2])) {
            } else {
                document.getElementById('wound_'+i+'_'+j).style.backgroundColor = '';
            }
        }
    }
}

function updateCompStats() {

}