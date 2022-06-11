function CC=AdjancyCorrPixelRandNew(Orignal,Encrypted) 
    Orignal=double(Orignal);
    Encrypted=double(Encrypted);
    %%
    k = 100;
    [m,n] = size(Orignal);    %// works with 3- and 1-channel images
    m=m-1;
    n=n-1;
    s = randsample(m*n, k);        %// get k random indices
    [X, Y] = ind2sub([m, n], s);   %// convert indices to x,y coordinates
    %%
    figure('Name','Correlation Coefficient Analysis ...'),  
    subplot(2,4,1),imshow(uint8(Orignal));
    subplot(2,4,5),imshow(uint8(Encrypted));
    %% horizontal
    hxO = Orignal(X,Y); 
    hyO = Orignal(X,Y+1); 
    Ho_xy = corrcoef(hxO,hyO);
    
    subplot(2,4,2),%title('horizontal Original')
    scatter(hxO(:),hyO(:),'.')
    axis([0 255 0 255]) 
    box on
    xlabel('Pixel gray value on location (x,y)') 
    ylabel('Pixel gray value on location (x,y+1)') 
    
    hxE = Encrypted(X,Y); 
    hyE = Encrypted(X,Y+1); 
    He_xy = corrcoef(hxE,hyE);
    subplot(2,4,6), %title('horizontal Encrypted')
    scatter(hxE(:),hyE(:),'.')
    axis([0 255 0 255])
    box on
    xlabel('Pixel gray value on location (x,y)') 
    ylabel('Pixel gray value on location (x,y+1)') 
    
    CC(1,1)=Ho_xy(1,2);
    CC(1,2)=He_xy(1,2);
    
    
    %% vertical 
    vxO = Orignal(X,Y); 
    vyO = Orignal(X+1,Y); 
    Vo_xy = corrcoef(vxO,vyO);
    subplot(2,4,3), %title('vertical Original')
    scatter(vxO(:),vyO(:),'.')
    axis([0 255 0 255]) 
    box on
    xlabel('Pixel gray value on location (x,y)') 
    ylabel('Pixel gray value on location (x+1,y)') 
    
    vxE = Encrypted(X,Y); 
    vyE = Encrypted(X+1,Y); 
    Ve_xy = corrcoef(vxE,vyE);
    subplot(2,4,7), %title('vertical Encrypted')
    scatter(vxE(:),vyE(:),'.')
    axis([0 255 0 255])
    box on
    xlabel('Pixel gray value on location (x,y)') 
    ylabel('Pixel gray value on location (x+1,y)') 
    
    CC(2,1)=Vo_xy(1,2);
    CC(2,2)=Ve_xy(1,2);
    
    %% diagonal 
    dxO = Orignal(X,Y); 
    dyO = Orignal(X+1,Y+1); 
    Do_xy = corrcoef(dxO,dyO);
    subplot(2,4,4), %title('Diagonal Original')
    scatter(dxO(:),dyO(:),'.')
    axis([0 255 0 255]) 
    box on
    xlabel('Pixel gray value on location (x,y)') 
    ylabel('Pixel gray value on location (x+1,y+1)') 
    
    dxE = Encrypted(X,Y); 
    dyE = Encrypted(X+1,Y+1); 
    De_xy = corrcoef(dxE,dyE);
    subplot(2,4,8), %title('Diagonal Encrypted')
    scatter(dxE(:),dyE(:),'.')
    axis([0 255 0 255])
    box on
    xlabel('Pixel gray value on location (x,y)') 
    ylabel('Pixel gray value on location (x+1,y+1)') 
    
    CC(3,1)=Do_xy(1,2);
    CC(3,2)=De_xy(1,2);
    
    %% Defaults for this blog post
%     width = 16;     % Width in inches
%     height = 6;    % Height in inches
%     alw = 0.75;    % AxesLineWidth
%     fsz = 5;      % Fontsize
%     lw = 1.5;      % LineWidth
%     msz = 2;       % MarkerSize
%     pos = get(gcf, 'Position');
%     set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%     %set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%     %set(gca, 'FontWeight','bold');
%     set(gcf,'InvertHardcopy','on');
%     set(gcf,'PaperUnits', 'inches');
%     papersize = get(gcf, 'PaperSize');
%     left = (papersize(1)- width)/2;
%     bottom = (papersize(2)- height)/2;
%     myfiguresize = [left, bottom, width, height];
%     set(gcf,'PaperPosition', myfiguresize);
% 
%     % Save the file as PNG
%     print('Fig81','-dtiff','-r300');
    
end