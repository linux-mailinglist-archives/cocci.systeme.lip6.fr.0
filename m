Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AFCEC655
	for <lists+cocci@lfdr.de>; Fri,  1 Nov 2019 17:03:39 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA1G3Foh020855;
	Fri, 1 Nov 2019 17:03:15 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4C3BC77C0;
	Fri,  1 Nov 2019 17:03:15 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 90C6D454C
 for <cocci@systeme.lip6.fr>; Fri,  1 Nov 2019 17:03:13 +0100 (CET)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA1G3DoQ011431;
 Fri, 1 Nov 2019 17:03:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572624192;
 bh=ikJ0n3S1DpXMiFWlPHHHohftlDXfD59qp725PesF35I=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ev2zClHMP0EpKVb6OPZXxwn4fE7xvz5w/o/Z9W1GdSRisAyVo0KNLetGR99Lsrgmr
 CxRz/UP2a5HmSlOmP1YgM2p8orWYnTKdo03+FlXJU0AfySlvmCZNGkpXllcSdFJDM9
 8fAipVUtXSNbrcW0y+oevJGlLBF1AaPZDlb45eo0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.35.66]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LgYOH-1hdUwP2hGv-00o1W6; Fri, 01
 Nov 2019 17:03:12 +0100
To: Julia Lawall <julia.lawall@lip6.fr>
References: <708207db-69d7-8962-e507-cd705142d0c4@web.de>
 <226b4ce7-8284-ed03-a478-98e3e532cb15@web.de>
 <08618116-cd93-fedb-f90e-64c17b319794@web.de>
 <alpine.DEB.2.21.1911011037250.2883@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <2f83ab36-33f7-f49b-8ed7-e8aae44b40e6@web.de>
Date: Fri, 1 Nov 2019 17:03:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911011037250.2883@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:/q9WPyDz8KrYnnjBxNYTzFo8qJIteyxlA5NsdKjKQiymVBnWbp+
 ZHjwVPRyhOoUrtQjXT5++rE2Eh8Um3xUerAtGvc7niakPL2KdADlRqcTYhJajvGAD0QFhcC
 nBcBTQglG1xrqp+YlKC+5d2Sj/9vNosyq2Qft7x+RIi08y1CMDFsV4YSCvnF2i0fbKa5Fzk
 gkmV9G28nnqMfUq8Ym3Jw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7LSkK1DMmMU=:s9AVCqxqCqfZDTwOPTZLfW
 K19BreTbhLBPQOr6MlKTEEDz5W8osmKJiGfI4ERpCAkaWjzkw+QoRCWhdCUucQd1cCMoWjSQL
 DATtEQF70whGZqKocJr9cJxTt/BQ2imqD4tQNMFEkyohYLIcvNOMtDDRuXQGmg8A1tgyWP39n
 gwRNZS/G3t/n2k/TbAD7o7EzaTWBVWtXeqyDzj4naQ1I9hUbYFMYE5mDVWPCloOqX0/pKWzye
 Ig5Cf3/IrhpdWV8WOsPtdn1fdA4a9lEiwZ0sRl+/6sDKn67mACS/DC1lD2DAapkK1LRAMfwdh
 +tJSXdQHk3zSMCz6fPL0rSKOO2wQ2fsZuN0Mwfi2fNeX+Fo3HI6LM8HWjESiq+zG4OQN4qH1y
 0T+CeWcPpH6i/j8RiDd0MZoub6QZwOCD4r9VxspMB7nhru9mh7yenVCDtpckiR84RHPSnynVe
 kIjh9J9b+JRTibAZMZJ0I9jVwNTmSauP9U9BdNxUZjNMcZY3ZZmjy+ZgJOQ/pVQkQBjxkEsCg
 FonPF7VOyjAb1x+2i2xhUcitS95H3+DDmJTyp0qWw9wTaHNReOB2ZzbyPAAYGrZwWxoFLcmLn
 odjsr/HvuhkzFT/Ztbk2PIntvDFk8I3Ibo4aOwuVGmdOL2025E1eKOCFnlBAiYlK43QS/u133
 ZsgOXvrg1lOJPY2rAz/E6NS+/sgFWMzXEGoNh0sHeuWZOKHqGWBDDFCLb6NZCUEMwmA+Yk5U7
 P79U0NcyLp5m4K8rH+i1K/Tb8xX1NwrKATXfrew81WWfYrsTdpr9iP+HBYn4y9jcRqC+H+nZd
 y/+RLXBCi13ova4ZT4cSyMb2rEPWT+q7VNhOvlpC6hSJFl5PnAiwkWs8sA98p0NRMEgZO7uT1
 Y4eRpOMM5gHIQqRxfPPZKRhwkeXQhl0FrDloIGgKvwSdwXIX3fC+yE7qYeNe+N6ru/Izk+Lq5
 gRj0Pn3e5k+0IB3MXjw/Vc1TuSkhjNaHKpdY5Jv5VSxUfTLjUc0Ys+/sQ7T0rBrHaOFxAICgf
 PE09J2v6BE54iQytHJtsBsvxLeQqC6mkJo/IQnWcQ6R1SE3RKcOJwp+w4q3xV2+s1MQuih9un
 mIzZ3b8pFgNVVpNbr5upJCfTPR0xyhwCIiQVUbjL6hyjDMCu7m8/yLWklBn7xeKznEaUbXSCG
 bBhFUfgBDYkrd6ocZTyf2zGoamrwC2U0tNILG+9p477aF5iFzmb5+AcefHtLaFUHs2vh/pYn+
 squdFYotZbEhOLcSePuJnt9w4Krtq3UEmgrsxltkjAAssXSL518cTdBCbQXM=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 17:03:18 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 17:03:13 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking code layout for adding jump targets with SmPL
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

PiBIb3cgd291bGQgeW91IGxpa2UgdG8gaW1wcm92ZSB0aGUgcHJldHR5LXByaW50aW5nIGZvciB0
aGUgQ29jY2luZWxsZSBzb2Z0d2FyZT8KCkkgZ3Vlc3MgdGhhdCBhbm90aGVyIHNtYWxsIHRlc3Qg
YXBwcm9hY2ggd2lsbCB0cmlnZ2VyIGZ1cnRoZXIgZGV2ZWxvcG1lbnQgY29uc2lkZXJhdGlvbnMu
CgpAcmVwbGFjZW1lbnRACkBACiBpZiAoLi4uKQotewotfQoraW5mbzoKK3B1dHMoInN1cnByaXNl
Iik7CgoKZWxmcmluZ0BTb25uZTp+L1Byb2pla3RlL0NvY2NpbmVsbGUvUHJvYmU+IHNwYXRjaCBl
bXB0eV9jb21wb3VuZF9zdGF0ZW1lbnRfZm9yX2lmMS5jIHJlcGxhY2VfZW1wdHlfY29tcG91bmRf
c3RhdGVtZW50X2Zvcl9pZjQuY29jY2kK4oCmCkBAIC0xLDUgKzEsNiBAQAogdm9pZCB4KHZvaWQp
CiB7Ci1pZiAoMSkgewotfQoraWYgKDEpIGluZm86CisKK3B1dHMoInN1cnByaXNlIik7CiB9CgoK
RG8geW91IGZpbmQgc3VjaCBhIHRlc3QgcmVzdWx0IGFsc28gcXVlc3Rpb25hYmxlPwoKUmVnYXJk
cywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkNvY2NpIG1haWxpbmcgbGlzdApDb2NjaUBzeXN0ZW1lLmxpcDYuZnIKaHR0cHM6Ly9zeXN0ZW1l
LmxpcDYuZnIvbWFpbG1hbi9saXN0aW5mby9jb2NjaQo=
