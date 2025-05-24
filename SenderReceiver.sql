SELECT TOP 1000 
    cs.SenderName, cs.SenderLastName, cs.SenderAddress, cs.SenderLat, cs.SenderLong, 
    cr.ReceiverName, cr.ReceiverLastName, cr.ReceiverAddress, cr.ReceiverLat, cr.ReceiverLong
FROM dsp.ContractSender cs 
JOIN dsp.ContractVersion cv ON cs.ContractVerId = cv.Id
JOIN dsp.ContractReceiver cr ON cr.ContractVerId = cv.Id
JOIN cmn.City senderCity ON senderCity.Id = cs.SenderCityId
JOIN cmn.City receiverCity ON receiverCity.Id = cr.ReceiverCityId
JOIN cmn.Province senderProv ON senderCity.ProvinceId = senderProv.Id
JOIN cmn.Province receiverProv ON receiverCity.ProvinceId = receiverProv.Id
WHERE senderProv.Name = N'تهران' AND receiverProv.Name = N'تهران'
AND cs.SenderLat is NOT NULL AND cs.SenderLong is NOT NULL AND cr.ReceiverLat is NOT NULL AND cr.ReceiverLong is NOT NULL