program parkiranMobil;
uses crt;
label 1,2;
type data = record
    Posisi : integer;
    Durasi : integer;
    kondisi : char;
    total : integer;
    ID : integer;
    end;
//Sub Program untuk membuat lahan parkir
procedure lahanParkir;
var i : integer;
begin
    for i:=1 to 101 do 
    begin
        gotoXY(i,10); write('_');
        if i<11 then
        begin
        gotoXY(6+(i-1)*10,5); write(i)
        end
        else if i<21 then
        begin
        gotoXY(6+(i-11)*10,15); write(i)
        end;
    end;
    for i:=1 to 20 do 
    begin
    gotoXY(1,i);write('|');
    gotoXY(11,i);write('|');
    gotoXY(21,i);write('|');
    gotoXY(31,i);write('|');
    gotoXY(41,i);write('|');
    gotoXY(51,i);write('|');
    gotoXY(61,i);write('|');
    gotoXY(71,i);write('|');
    gotoXY(81,i);write('|');
    gotoXY(91,i);write('|');
    gotoXY(101,i);write('|');
    end;
    for i:=1 to 200 do 
    begin
        gotoXY(i,21); write('_');
    end;
end;
//sub program untuk pelaporan masalah
function laporanMasalah(j : string):string;
var i : integer;
begin
    for i := 100 to 150 do 
    begin
    gotoXY(i,26);write('-');
    gotoXY(i,29);write('-');
    gotoXY(i,32); write('-');
    end;
    for i:=27 to 31 do 
    begin   
    gotoXY(150,i);write('|');
    gotoXY(110,i);write('|');
    gotoXY(100,i);write('|');
    if i < 29 then 
    begin
    gotoXY(101,i+3);write(i-26,'.');
    end;
    end;
    gotoXY(101,28);write(' No ');
    gotoXY(125,28);write(' Masalah ');
    
    gotoXY(111,30); write(j);


end;

var i,n,j: integer;
    kendaraan : array[1..999] of data;
    pilih : char;
    masalah : string;
begin
    clrscr;
    lahanParkir;
    //membuat kondisi awal lahan parkiran kosong
    for i:=1 to 20 do 
    begin
        kendaraan[j].kondisi:='Y';
    end;
    j:=1;
    repeat
    //memilih aktivitas apa yang ingin dikerjakan 
    2:
    gotoXY(1,22); write('Pilih Aktivitas : ');
    gotoXY(1,23); write('1. Masuk Parkiran');
    gotoXY(1,24); write('2. Keluar Parkiran');
    gotoXY(1,25); write('3. Laporan Masalah'); 
    gotoXY(1,26); readln(n);
    case n of 
    1 : begin
            1 : 
            //masuk parkiran
            gotoXY(1,27);
            begin
            write('Masukkan posisi parkir : ');
            readln(j);
            kendaraan[j].Posisi:=j;
            end;
            gotoXY(1,28);begin
            write('Masukkan ID kendaraan Anda : '); readln(kendaraan[j].ID); 
            end; 
            
                if (kendaraan[j].kondisi= 'N') then 
                begin
                    gotoXY(10,30); write('Sudah penuh ');
                    goto 1;
                end;

            for i:=1 to 20 do
            begin
                if kendaraan[j].Posisi<11 then
                begin
                    if kendaraan[j].Posisi = i then
                    begin
                        gotoXY(5+(i-1)*10,5);write('XXX');
                        kendaraan[j].kondisi:='N';
                    end;
                end
                else if kendaraan[j].Posisi<21 then
                    begin
                        if kendaraan[j].Posisi = i then
                        begin
                            gotoXY(5+(i-11)*10,15);write('XXX');
                            kendaraan[j].kondisi:='N';
                        end;
                end;
            end;   
        end;
    //keluar parkiran
    2: begin
        gotoXY(40,27); 
        begin
            write('Masukkan posisi parkir : '); readln(j);
            kendaraan[j].posisi:=j;
        end;
        gotoXY(40,28);write('Masukkan durasi parkir(menit) : '); readln(kendaraan[j].Durasi);
        kendaraan[j].total:=kendaraan[j].Durasi*85;
        if kendaraan[j].kondisi='N' then
        begin
         for i:=1 to 20 do
            begin
                if kendaraan[j].Posisi<11 then
                begin
                    if kendaraan[j].Posisi = i then
                    begin
                        gotoXY(5+(i-1)*10,5);write(i,i,i);
                        kendaraan[j].kondisi:='Y';
                    end;
                end
                else if kendaraan[j].Posisi<21 then
                begin
                    if kendaraan[j].Posisi = i then
                    begin
                            gotoXY(5+(i-11)*10,15);write(i,i);
                            kendaraan[j].kondisi:='Y';
                    end;
                end;
            end;
        end
        else 
        begin
            gotoXY(40,29); write('Belum Ada Kendaraan ');
            goto 2;
        end;
        gotoXY(140,1); write('==RECEIPT==');
        gotoXY(102,2);write('=================================================================================================');
        gotoXY(102,5);write('Rp.5.000 per Jam');
        gotoXY(102,6);write('=================================================================================================');
        gotoXY(102,7);write('POSISI PARKIR : ',kendaraan[j].Posisi);
        gotoXY(102,9);write('DURASI PARKIR :',kendaraan[j].Durasi,' Menit');
        gotoXY(102,10);write('ID KENDARAAN :',kendaraan[j].ID);
        gotoXY(102,11);write('KONDISI : KELUAR PARKIRAN');
        gotoXY(102,12);write('================================================================================================');
        gotoXY(140,13);write('BIAYA PARKIR : ',kendaraan[j].total);
        gotoXY(135,15);write('********TERIMAKASIH********');
        gotoXY(145,16);write(' /\_/\  ');
        gotoXY(145,17);write('( o.o ) ');
        gotoXY(145,18);write(' > ^ <  ');

       end;
    //pelaporan masalah
       3: begin
            gotoXY(100,22);write('Tulis Masalah yang kamu alami : '); readln(masalah);
            laporanMasalah(masalah);
       end;
    end;
    gotoXY (1,29);
    begin
    write('Apakah ada aktivitas lain?'); readln(pilih);
    end;
    j:=j+1;
    until Pilih='N';
//program SELESAI
gotoXY(1,31); writeln('SELESAI');
end.