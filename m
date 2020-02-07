Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B1155287
	for <lists+cocci@lfdr.de>; Fri,  7 Feb 2020 07:46:25 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0176k78D021771;
	Fri, 7 Feb 2020 07:46:07 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E2CED77FB;
	Fri,  7 Feb 2020 07:46:06 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AE3BA772B
 for <cocci@systeme.lip6.fr>; Fri,  7 Feb 2020 07:26:48 +0100 (CET)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0176QLow014914
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Fri, 7 Feb 2020 07:26:46 +0100 (CET)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4F2E0BBDA35F38D57D57
 for <cocci@systeme.lip6.fr>; Fri,  7 Feb 2020 14:26:17 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 7 Feb 2020
 14:26:11 +0800
To: <cocci@systeme.lip6.fr>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <33151da0-3414-a1de-5828-58fc89d77390@huawei.com>
Date: Fri, 7 Feb 2020 14:26:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 07 Feb 2020 07:46:07 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 07 Feb 2020 07:26:48 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 07 Feb 2020 07:46:05 +0100
Cc: kuhn.chenqun@huawei.com
Subject: [Cocci]  Q: does spatch understand g_autoptr/g_autofree?
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

Hello,

I have an example:

    @@ expression d,p; @@

    - g_autoptr(d) p;
    + g_autoptr(d) p = NULL;

C source code:

    void f(void)
    {
        g_autoptr(Test) *p1;
    }

Then I got this error:
minus: parse error:
  File "test.cocci", line 3, column 15, charpos = 38
  around = 'p',
  whole content = - g_autoptr(d) p;


is it correct?
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
