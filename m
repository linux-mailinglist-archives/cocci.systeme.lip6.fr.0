Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17110747D
	for <lists+cocci@lfdr.de>; Fri, 22 Nov 2019 16:03:19 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAMF2wUS026646;
	Fri, 22 Nov 2019 16:02:58 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 525AC77E5;
	Fri, 22 Nov 2019 16:02:58 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B837F77D2
 for <cocci@systeme.lip6.fr>; Fri, 22 Nov 2019 16:02:55 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAMF2t3u029931;
 Fri, 22 Nov 2019 16:02:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1574434975;
 bh=D0dIo4DjFX3xC02xBbxqAf3ul4MybBP+zwZb8wtQIBs=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=TT63W5M9Su+/fUUyKTby87wypBmfKqoJX9v/r+bxq2c/Opyn1gfRyOhvva1HMhOBZ
 fNwtzpD9/oMswR9EXjAkFl3L1ckNm9dEHTrAA26vIHpVct97rRMMrcMpg7RqNJaWXV
 lHwXynQsBjgEeiELdmT/OR/QsjSVhJOeqDKGeOJA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.244.174.75]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MHowb-1iYzhi3t9R-003clN; Fri, 22
 Nov 2019 15:56:24 +0100
To: Julia Lawall <julia.lawall@lip6.fr>
References: <cc561358-4d00-9f1f-eaa2-8fae400ccc8b@web.de>
 <alpine.DEB.2.21.1911221025570.2793@hadrien>
 <8a44f286-72ad-14c4-6ee9-b8aa25ccba3e@web.de>
 <alpine.DEB.2.21.1911221050320.2793@hadrien>
 <46f7430f-8176-27ed-1150-af9fc69b03a7@web.de>
 <alpine.DEB.2.21.1911221134210.2793@hadrien>
 <da29f2ea-7037-3237-8ec5-4464379e7a54@web.de>
 <alpine.DEB.2.21.1911221155320.2793@hadrien>
 <599a5c47-75c5-f0a8-afe9-3563a20b70d3@web.de>
 <alpine.DEB.2.21.1911221351470.2793@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <87ef6d2d-a66c-5566-ee27-db360235c332@web.de>
Date: Fri, 22 Nov 2019 15:56:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911221351470.2793@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:CfzUoyUhkTJyWV3gBN6gwyJ9VK4JfO9IvXFCmbwogWkhDZkfC3q
 g9GPiDlgmxMK4s537A+WQMFdRnlywoty+Do+5dIkPUZpMPuii1DeGFPbXVDdjIllwvKI/EA
 MJM4rIWQUZtUd1YhEp2Swh0sd7GfSKU/DilfGAE6spgPLVsfZ0uRjHIkpPjbrK33TWwXieQ
 2cR6Mr5sDdEzVSLfgXp1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2me4ywLG4sk=:d6/+AXfxbAmhles/I6kZOE
 U6mghiKx5Q+W5dvKa4j24juLSF0oy74H5Vyk4EkDqdHQ0ewAj1GCqWWfgmgdwTF6hnOra+PDd
 H5LixNyka6xRP+PGmK8YyPUPoIg7aKtNlEgMmR+2iFeEzMLj0vbMO7HlXqog825SFs54qoiUP
 E+0cR6I/K2LYA8TBb33/lnzNA+rBsXtTXeHySgZxip0lUHyMnrHCFo/8Ob827f/fJal6Hizwy
 w205lbyIjEaWVAEKp1+VXW3WMmkS64bPCGqlZhQzEL89tYhP728OLpJMbKVNO4ccCIMTinBfl
 32XcnK/3zJ9o/IwRVlTlXVkH3kVV2d/bVzfEg1lRoxYKN7qPyRLIfsGWBLv5W+LvenmZsiKhx
 brPpPQU0iH6cs+Enic++ZePdhu7KiLS0xJhv+StJgw2NpOi+G+2UJZrHxRsaYzdO4ELkc9+Su
 giChaAj5w1lBzO/K1WKuvCiwr/E9N+As+mbJU8WuFWkq/RAGSCCPcg6Ys4d1PD7x31EWSgsbO
 VIw63rDu4PjZbx5qeFbMEvtt1Ss7ck0GQ17pXKclnIBlNzG9/JzuPoJcx4+ll2yfwftbfWM7f
 HYcV2YHJBDOZXqBDGppTTvGs6xLxaGg6VvX54d/aIrmZL+efyB/z1F9MyeFuEEPyxmOrM9Afr
 +uhVGeDH0thta7PssKdw1b35jJWCROTQVb1sqdJiPaE8zjmMrT3S9aW+p1HRzgl+ILM3d75ca
 WCFyEjYAZkjVN5bLmONMMmyRzi+BBWSuBkSOFj+5nW1iTj6hsBkwFPcV2Bdy44RCeGAAd1RUZ
 WbtseDW3xJIwqA37jaYnrFdeP75ii8UG8WvVZp4ZtrZ3kRVBAAbIVGALeykXE2Lr82JVlFm4p
 05U5cseVxg01h+wdrhukV2yRkIDV7nGrGzIUJRuikmak4HcEDIttZmlDu6JvRsfwC2nHp9Hrh
 bEH7ClXj8O5vSevgLhFX3k22jV1E4BvaWn0M/WOUg2jFWtQ1muGR4wOXvNUv3pWB7L927twNJ
 xNCdJy7ueyrGTOU1GJ0+21eMEdmg38IIJ4ZcglX3Nj84qWB7+L2l53FkaZw48rvUUWbEjvHwm
 CN89zIwDNwWsGfwreIO6J1B9liWQvJDmrGv0Ez+Q6gvfoaHOkUnKVAv+Phs/2ykJjcWBuY1bJ
 ShIAXoR7f57zfFtFDoUNepRdweOIbYdHebbL09nnjnWd4WD4j2nkqsQKLb5QOdsXTbCgyM+Gq
 GwLO4zk3KwxTG6MyUK7TuR1ZfPj49qVvfmdBohYX1BqKXbb9HY4G0nnTzIMQ=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 22 Nov 2019 16:02:59 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 22 Nov 2019 16:02:55 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Concerns around type safety for usage of expressions
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

PiBUICpwdHIgZm9yIGV4YW1wbGUuCgoxLiBEb2VzIHRoaXMgaW5mb3JtYXRpb24gZm9yIGEg4oCc
dHlwZSBjb25zdHJhaW504oCdIGRpc3RyYWN0IGZyb20gbXkgcXVlc3Rpb25zPwoKMi4gQ2FuIHRo
ZSBkYXRhIHR5cGUgYmVjb21lIHJlc3RyaWN0ZWQgbm90IG9ubHkgYnkgdGhlIGRldGFpbAogICB0
aGF0IGl0IHJlZmVycyB0byBhIHBvaW50ZXI/CgozLiBXaHkgc2hvdWxkIHN1Y2ggYSBTbVBMIHNw
ZWNpZmljYXRpb24gbWF0dGVyIGZvciB0aGUgaGFuZGxpbmcgb2YgZXhwcmVzc2lvbnM/CgpSZWdh
cmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQ29jY2kgbWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3Rl
bWUubGlwNi5mci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
