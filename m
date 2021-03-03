Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3632B905
	for <lists+cocci@lfdr.de>; Wed,  3 Mar 2021 16:47:11 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 123FkTKU021021;
	Wed, 3 Mar 2021 16:46:29 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5A92677DF;
	Wed,  3 Mar 2021 16:46:29 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C970E571B
 for <cocci@systeme.lip6.fr>; Wed,  3 Mar 2021 16:46:27 +0100 (CET)
Received: from smtprelay.hostedemail.com (smtprelay0062.hostedemail.com
 [216.40.44.62])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 123FkQSW015092
 for <cocci@systeme.lip6.fr>; Wed, 3 Mar 2021 16:46:26 +0100 (CET)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 0EA39801C320
 for <cocci@systeme.lip6.fr>; Wed,  3 Mar 2021 02:47:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 42E2418225631;
 Wed,  3 Mar 2021 02:47:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 90, 9, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3867:3868:3870:3871:3872:4031:4321:4605:5007:6119:7652:7903:8603:10004:10400:11026:11232:11658:11914:12043:12295:12297:12438:12555:12740:12760:12895:12986:13069:13311:13357:13439:14181:14659:14721:21080:21433:21611:21627:21740:21741:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: tin16_1602863276c1
X-Filterd-Recvd-Size: 2532
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Wed,  3 Mar 2021 02:47:52 +0000 (UTC)
Message-ID: <6b8b250a06a98ce42120a14824531a8641f5e8aa.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 02 Mar 2021 18:47:51 -0800
In-Reply-To: <alpine.DEB.2.22.394.2103022241050.2906@hadrien>
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
 <alpine.DEB.2.22.394.2103022241050.2906@hadrien>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 03 Mar 2021 16:46:45 +0100 (CET)
X-Greylist: Delayed for 22:03:31 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Wed, 03 Mar 2021 16:46:26 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        cocci <cocci@systeme.lip6.fr>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: [Cocci] linux-kernel janitorial RFP: Mark static arrays as const
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

On Tue, 2021-03-02 at 22:41 +0100, Julia Lawall wrote:
> 
> On Tue, 2 Mar 2021, Joe Perches wrote:
> 
> > Here is a possible opportunity to reduce data usage in the kernel.
> 
> Does it actually reduce data usage?

Yes, at least for gcc.  For instance:

$ gcc --version
gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0

And with the diff below (x86-64 defconfig with hwmon/pmbus and max20730)

$ diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 9dd3dd79bc18..b824eab95456 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -434,7 +434,7 @@ static long direct_to_val(u16 w, enum pmbus_sensor_classes >
        return d;
 }
 
-static u32 max_current[][5] = {
+static const u32 max_current[][5] = {
        [max20710] = { 6200, 8000, 9700, 11600 },
        [max20730] = { 13000, 16600, 20100, 23600 },
        [max20734] = { 21000, 27000, 32000, 38000 },

$ size drivers/hwmon/pmbus/max20730.o*
   text	   data	    bss	    dec	    hex	filename
   9245	    256	      0	   9501	   251d	drivers/hwmon/pmbus/max20730.o.gcc.new
   9149	    352	      0	   9501	   251d	drivers/hwmon/pmbus/max20730.o.gcc.old

with clang-11 it doesn't seem to make a difference:

$ /usr/bin/clang --version
Ubuntu clang version 11.0.0-2

$ size drivers/hwmon/pmbus/max20730.o*
   text	   data	    bss	    dec	    hex	filename
   9166	    256	      1	   9423	   24cf	drivers/hwmon/pmbus/max20730.o.clang-11.new
   9166	    256	      1	   9423	   24cf	drivers/hwmon/pmbus/max20730.o.clang-11.old


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
