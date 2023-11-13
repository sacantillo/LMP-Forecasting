define_constants;
Base = loadcase('case118');
Demanda = Base.bus(:,PD);
dem_MonteCarlo = zeros(1000,size(Demanda,1))
LMP = zeros(1000,size(Demanda,1))
for h=1:1:1000
    for i=1:1:size(Demanda,1)
        dem_MonteCarlo(h,i) = unifrnd(Demanda(i)*0.5,Demanda(i)*1.5);
        Base.bus(i, PD) = dem_MonteCarlo(h,i);
    end
    result = runopf(Base);
    LMP(h,:) = result.bus(:,LAM_P)
end
Salida = [dem_MonteCarlo LMP]
%csvwrite ('dataset.csv', Salida)