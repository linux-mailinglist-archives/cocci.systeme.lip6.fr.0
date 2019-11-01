Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F0EBBF7
	for <lists+cocci@lfdr.de>; Fri,  1 Nov 2019 03:27:10 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA12QaLM022423;
	Fri, 1 Nov 2019 03:26:36 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5C98477D2;
	Fri,  1 Nov 2019 03:26:36 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B483677BA
 for <cocci@systeme.lip6.fr>; Fri,  1 Nov 2019 03:26:33 +0100 (CET)
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA12QVBr026302
 for <cocci@systeme.lip6.fr>; Fri, 1 Nov 2019 03:26:32 +0100 (CET)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 918BE6BD688C5A942379;
 Fri,  1 Nov 2019 10:26:28 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl1.zte.com.cn with SMTP id xA12Pkqd026949;
 Fri, 1 Nov 2019 10:25:46 +0800 (GMT-8)
 (envelope-from zhong.shiqi@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid32;
 Fri, 1 Nov 2019 10:25:46 +0800 (CST)
Date: Fri, 1 Nov 2019 10:25:46 +0800 (CST)
X-Zmail-TransId: 2afa5dbb97aa9e36f983
X-Mailer: Zmail v1.0
Message-ID: <201911011025466261419@zte.com.cn>
In-Reply-To: <d86976ac-f12b-ba0a-fc96-57ece8741db5@web.de>
References: 1572404070-41580-1-git-send-email-zhong.shiqi@zte.com.cn,
 d86976ac-f12b-ba0a-fc96-57ece8741db5@web.de
Mime-Version: 1.0
From: <zhong.shiqi@zte.com.cn>
To: <Markus.Elfring@web.de>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl1.zte.com.cn xA12Pkqd026949
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 03:26:38 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 01 Nov 2019 03:26:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: wang.yi59@zte.com.cn, michal.lkml@markovi.net, nicolas.palix@imag.fr,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci]
	=?utf-8?q?=5BPATCH_v5=5D_coccicheck=3A_Support_search_for?=
	=?utf-8?q?_SmPL_scripts_withinselected_directory_hierarchy?=
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PiBJIGdvdCB0aGUgaW1wcmVzc2lvbiB0aGF0IHlvdSBhcmUgc3RydWdnbGluZyB3aXRoIGRpZmZp
Y3VsdGllcyAoZm9yIHVua25vd24gcmVhc29ucykKPiBhcm91bmQgYWRkaW5nIHNwYWNlIGNoYXJh
Y3RlcnMgYXQgc29tZSBwbGFjZXMuCj4gSG93IHdvdWxkIHlvdSBsaWtlIHRvIGltcHJvdmUgdGhp
cyBzaXR1YXRpb24/CgpUaGFua3MgZm9yIHlvdXIgY29uY2VybixidXQgaSBoYXZlbid0IHN0cnVn
Z2xlZCB3aXRoIGFueXRoaW5nLkkgdGhpbmsgaSdtIHVzZWQgdG8KYWRkaW5nIHNwYWNlIGNoYXJh
Y3RlcnMuCgoKPiA+ICpBbGxvdyBkZWZpbmluZyB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUg4oCc
Q09DQ0nigJ0gYXMgYSBkaXJlY3RvcnkgdG8gc2VhcmNoCj4gPiBTbVBMIHNjcmlwdHMuCj4gPiAK
PiA+ICpTdGFydCBhIGNvcnJlc3BvbmRpbmcgZmlsZSBkZXRlcm1pbmF0aW9uIGlmIGl0IGNvbnRh
aW5zIGFuIGFjY2VwdGFibGUKPiA+IHBhdGguCj4gCj4gKiBBbGxvdyBkZWZpbmluZyB0aGUgZW52
aXJvbm1lbnQgdmFyaWFibGUg4oCcQ09DQ0nigJ0gYXMgYSBkaXJlY3RvcnkKPiAgIHRvIHNlYXJj
aCBTbVBMIHNjcmlwdHMuCj4gCj4gKiBTdGFydCBhIGNvcnJlc3BvbmRpbmcgZmlsZSBkZXRlcm1p
bmF0aW9uIGlmIGl0IGNvbnRhaW5zCj4gICBhbiBhY2NlcHRhYmxlIHBhdGguCj4gCj4gCj4gV291
bGQgeW91IGxpa2UgdG8gdXBkYXRlIHRoZSBwcm92aWRlZCBzb2Z0d2FyZSBkb2N1bWVudGF0aW9u
IHRvZ2V0aGVyIHdpdGgKPiB0aGUgc21hbGwgZXh0ZW5zaW9uIG9mIHRoaXMgYmFzaCBzY3JpcHQ/
Cj4gCj4gVXBkYXRlIGNhbmRpZGF0ZXM6Cj4gKiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9u
L2Rldi10b29scy9jb2NjaW5lbGxlLnJzdD9pZD0yM2ZkYjE5OGFlODFmNDdhNTc0Mjk2ZGFiNTE2
N2M1ZTEzNmEwMmJhI24xODkKPiAKPiAqIGh0dHBzOi8vYm90dGVzdC53aWtpLmtlcm5lbC5vcmcv
Y29jY2ljaGVjayNjb250cm9sbGluZ193aGljaF9maWxlc19hcmVfcHJvY2Vzc2VkX2J5X2NvY2Np
bmVsbGUKPiAKPiAKPiA+IC0tLQo+IAo+IOKAoyBXb3VsZCB5b3UgZmluZCB0aGUgcGF0Y2ggY2hh
bmdlIGxvZyBzdWZmaWNpZW50IHdpdGhvdXQgdGhlIGluZm9ybWF0aW9uCj4gICDigJxDaGFuZ2Vz
IGlu4oCdPwo+IAo+IOKAoyBJIGZpbmQgdGhlIHNwZWNpZmljYXRpb24g4oCcMTrigJ0gdW5uZWNl
c3NhcnkgYmVmb3JlIGEgc2luZ2xlIGRlc2NyaXB0aW9uIGl0ZW0uCj4gCj4gUmVnYXJkcywKPiBN
YXJrdXMKCk9LLGkgYW0gdW5kZXJzdGFuZC4gWW91IGFyZSByaWdvcm91cy4KCnRoYW5rcywKWmhv
bmcuc2hpcWk=


--=====_003_next=====--

--=====_001_next=====
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--=====_001_next=====--

