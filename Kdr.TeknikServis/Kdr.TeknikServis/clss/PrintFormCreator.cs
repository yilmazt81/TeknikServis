
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ThoughtWorks.QRCode.Codec;
using System.IO;
using Kdr.DBLayer;

using Kdr.TeknikServis.ReportForm;
using CrystalDecisions.CrystalReports.Engine;
using Kdr.TeknikServis.forms;

namespace Kdr.TeknikServis
{
    public class PrintFormCreator
    {
       

        public static byte[] ImageToByte2(System.Drawing.Image img)
        {
            using (var stream = new MemoryStream())
            {
                img.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                return stream.ToArray();
            }
        }
        public static void CreateMinites(TamirTeslim tamirTeslim)
        {
 
            string logoPath = Application.StartupPath + @"\ReportForm\logo.png";


            var qrCodeEncoder = new QRCodeEncoder
            {
                QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE,

                QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.L

            };
            qrCodeEncoder.QRCodeVersion = 6;

            Bitmap bImage = qrCodeEncoder.Encode(tamirTeslim.Barcode);

            var musteri = MemberRepository.GetMusteri(tamirTeslim.MusteriId);
            CrystalReportTutanak crystalReportTutanak = new CrystalReportTutanak();

            List<TutanakPrint> tutanakPrints = new List<TutanakPrint>()
            {
                new TutanakPrint()
                {
                    Logo=File.ReadAllBytes(logoPath),
                    Barcode=ImageToByte2((System.Drawing.Image)bImage),
                    Aksesuarlar=tamirTeslim.TeslimAlinanAksesuar,
                    ArizaAciklama=tamirTeslim.MusteriSorunAciklama,
                    Marka=tamirTeslim.Marka,
                    Model=tamirTeslim.Model,
                    SeriNo=tamirTeslim.SeriNo,
                    Tarih=tamirTeslim.TeslimTarihi.Value.ToString("dd.MM.yyyy HH:mm"),
                    BarcodeValue=tamirTeslim.Barcode,
                    MusteriAdi=musteri.TamAdi,
                    MusteriAdres=musteri.Adres+" "+AdressRepository.GetDistrict(musteri.IlceId.Value).IlceAdi+" "+ AdressRepository.GetCity(musteri.IlId.Value).IlAdi,
                    MusteriTelefon=musteri.GsmNo

                }
            };
            crystalReportTutanak.SetDataSource(tutanakPrints);
            FormReportViewer formReportViewer = new FormReportViewer(crystalReportTutanak);
            formReportViewer.ShowDialog();

        }

        public static void CreateCargoDoc(TamirTeslim tamirTeslim, CihazKargoGonderim kargoGonderim)
        {

            string logoPath = Application.StartupPath + @"\ReportForm\logo.png";


            var qrCodeEncoder = new QRCodeEncoder
            {
                QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE,

                QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.L

            };
            qrCodeEncoder.QRCodeVersion = 6;

            Bitmap bImage = qrCodeEncoder.Encode(tamirTeslim.Barcode);

            var musteri = MemberRepository.GetMusteri(tamirTeslim.MusteriId);
            CrystalReportCargo crystalReportTutanak = new CrystalReportCargo();

            List<TutanakPrint> tutanakPrints = new List<TutanakPrint>()
            {
                new TutanakPrint()
                {
                    Logo=File.ReadAllBytes(logoPath),
                    Barcode=ImageToByte2((System.Drawing.Image)bImage),
                    Aksesuarlar=tamirTeslim.TeslimAlinanAksesuar,
                    ArizaAciklama=tamirTeslim.TeknikPersonelAciklama,
                    Marka=tamirTeslim.Marka,
                    Model=tamirTeslim.Model,
                    SeriNo=tamirTeslim.SeriNo,
                    Tarih=tamirTeslim.TeslimTarihi.Value.ToString("dd.MM.yyyy HH:mm"),
                    BarcodeValue=tamirTeslim.Barcode,
                    MusteriAdi=musteri.TamAdi,
                    MusteriAdres=musteri.Adres+" \n"+AdressRepository.GetDistrict(musteri.IlceId.Value).IlceAdi+" / "+ AdressRepository.GetCity(musteri.IlId.Value).IlAdi,
                    MusteriTelefon=musteri.GsmNo,
                    GonderiNo=kargoGonderim.GonderiNumarasi

                }
            };
            crystalReportTutanak.SetDataSource(tutanakPrints);
            FormReportViewer formReportViewer = new FormReportViewer(crystalReportTutanak);
            formReportViewer.ShowDialog();

        }

    }
}
