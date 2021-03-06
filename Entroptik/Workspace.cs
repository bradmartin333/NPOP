﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace Entroptik
{
    [Serializable]
    public class Workspace
    {
        public Point Guide = new Point(110, 110);
        public Point GridSize = new Point(5, 5);
        public Size FeatureSize = new Size(70, 70);
        public Point Pitch = new Point(145, 145);
        public (double, double) Pass = (12.0, 2.0);
        public (double, double) Fail = (2.0, 2.0);
        public List<int> DataOrientation = new List<int>();
        [NonSerialized]
        public string DirectoryPath = @"C:\";
        [NonSerialized]
        public string FilePath = null;
        [NonSerialized]
        public string OutputPath = null;
        [NonSerialized]
        public string[] Images = null;
        [NonSerialized]
        public int ImageIndex = 0;
    }

    public static class FileHandler
    {
        public static Workspace Workspace = new Workspace();
        public static FormMain FormMain = null;
        public static PictureBox PictureBox = null;
        public static bool Loaded = false;

        public static void LoadWorkspaceParameters()
        {
            FormMain.numGuideX.Value = Workspace.Guide.X;
            FormMain.numGuideY.Value = Workspace.Guide.Y;
            FormMain.numX.Value = Workspace.GridSize.X;
            FormMain.numY.Value = Workspace.GridSize.Y;
            FormMain.numWid.Value = Workspace.FeatureSize.Width;
            FormMain.numHgt.Value = Workspace.FeatureSize.Height;
            FormMain.numXpitch.Value = Workspace.Pitch.X;
            FormMain.numYpitch.Value = Workspace.Pitch.Y;
            FormMain.numPassScore.Value = (decimal)Workspace.Pass.Item1;
            FormMain.numPassTol.Value = (decimal)Workspace.Pass.Item2;
            FormMain.numFailScore.Value = (decimal)Workspace.Fail.Item1;
            FormMain.numFailTol.Value = (decimal)Workspace.Fail.Item2;
            Data.ClearArray();
            Imaging.ShowImage();
            Loaded = true;
        }

        public static void WriteParametersToBinaryFile()
        {
            using (Stream stream = File.Open(Workspace.FilePath, false ? FileMode.Append : FileMode.Create))
            {
                var binaryFormatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                binaryFormatter.Serialize(stream, Workspace);
            }
        }

        public static void ReadParametersFromBinaryFile()
        {
            using (Stream stream = File.Open(Workspace.FilePath, FileMode.Open))
            {
                var binaryFormatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                Workspace = (Workspace)binaryFormatter.Deserialize(stream);
            }
            LoadWorkspaceParameters();
        }
    }
}
