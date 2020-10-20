Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1029384E
	for <lists+cocci@lfdr.de>; Tue, 20 Oct 2020 11:38:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09K9cGWf025581;
	Tue, 20 Oct 2020 11:38:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 424E877BF;
	Tue, 20 Oct 2020 11:38:16 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6239845D8
 for <cocci@systeme.lip6.fr>; Tue, 20 Oct 2020 11:09:27 +0200 (CEST)
Received: from huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09K99NEB028230
 for <cocci@systeme.lip6.fr>; Tue, 20 Oct 2020 11:09:26 +0200 (CEST)
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 3EE7920D36A57E62FF7A
 for <cocci@systeme.lip6.fr>; Tue, 20 Oct 2020 17:09:21 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 20 Oct 2020 17:09:21 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 20 Oct 2020 17:09:20 +0800
To: <cocci@systeme.lip6.fr>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <ab7c6405-6384-9454-1219-08666b51c5c7@huawei.com>
Date: Tue, 20 Oct 2020 17:09:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 20 Oct 2020 11:38:18 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 20 Oct 2020 11:09:26 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Tue, 20 Oct 2020 11:38:14 +0200
Cc: xiexiangyou 00584000 <xiexiangyou@huawei.com>
Subject: [Cocci] spatch issue with compound literals
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hi,
I tried to use coccinelle to add an empty element to compound literals
using spatch version 1.0.8 compiled with OCaml version 4.10.0.

Here is my script:
@@
identifier a;
identifier fld;
expression E;
@@
 struct A a = {
     ...,
     .fld = (struct B[]) {
         ...,
         { ..., E, ... },
+        {  }
     },
     ...,
 };

And I received the following error:
minus: parse error:
  File "add-end-of-list.cocci", line 8, column 21, charpos = 97
  around = '[',
  whole content =      .fld = (struct B[]) {

Am I missing something?

Thanks,
Peng
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
