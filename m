Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D515FC9E48
	for <lists+cocci@lfdr.de>; Thu,  3 Oct 2019 14:22:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x93CMCuM028818;
	Thu, 3 Oct 2019 14:22:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E436577CA;
	Thu,  3 Oct 2019 14:22:11 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 14E4F76E8
 for <cocci@systeme.lip6.fr>; Mon, 30 Sep 2019 04:32:28 +0200 (CEST)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8U2WQum027051
 for <cocci@systeme.lip6.fr>; Mon, 30 Sep 2019 04:32:27 +0200 (CEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 68D437E31D355E6E3DF1;
 Mon, 30 Sep 2019 10:32:23 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 30 Sep 2019 10:32:19 +0800
To: Julia Lawall <julia.lawall@lip6.fr>
References: <20190928094245.45696-1-yuehaibing@huawei.com>
 <alpine.DEB.2.21.1909280542490.2168@hadrien>
 <2c109d6b-45ad-b3ca-1951-bde4dac91d2a@huawei.com>
 <alpine.DEB.2.21.1909291810300.3346@hadrien>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <ac79cb42-1713-8801-37e4-edde540f101c@huawei.com>
Date: Mon, 30 Sep 2019 10:32:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909291810300.3346@hadrien>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 03 Oct 2019 14:22:12 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 30 Sep 2019 04:32:27 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Thu, 03 Oct 2019 14:22:09 +0200
Cc: michal.lkml@markovi.net, nicolas.palix@imag.fr, maennich@google.com,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [RFC PATCH] scripts: Fix coccicheck failed
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

On 2019/9/30 0:32, Julia Lawall wrote:
> 
> 
> On Sun, 29 Sep 2019, Yuehaibing wrote:
> 
>> On 2019/9/28 20:43, Julia Lawall wrote:
>>>
>>>
>>> On Sat, 28 Sep 2019, YueHaibing wrote:
>>>
>>>> Run make coccicheck, I got this:
>>>>
>>>> spatch -D patch --no-show-diff --very-quiet --cocci-file
>>>>  ./scripts/coccinelle/misc/add_namespace.cocci --dir .
>>>>  -I ./arch/x86/include -I ./arch/x86/include/generated
>>>>  -I ./include -I ./arch/x86/include/uapi
>>>>  -I ./arch/x86/include/generated/uapi -I ./include/uapi
>>>>  -I ./include/generated/uapi --include ./include/linux/kconfig.h
>>>>  --jobs 192 --chunksize 1
>>>>
>>>> virtual rule patch not supported
>>>> coccicheck failed
>>>>
>>>> It seems add_namespace.cocci cannot be called in coccicheck.
>>>
>>> Could you explain the issue better?  Does the current state cause make
>>> coccicheck to fail?  Or is it just silently not being called?
>>
>> Yes, it cause make coccicheck failed like this:
>>
>> ...
>> ./drivers/xen/xenbus/xenbus_comms.c:290:2-8: preceding lock on line 243
>> ./fs/fuse/dev.c:1227:2-8: preceding lock on line 1206
>> ./fs/fuse/dev.c:1232:3-9: preceding lock on line 1206
>> coccicheck failed
>> make[1]: *** [coccicheck] Error 255
>> make: *** [sub-make] Error 2
> 
> Could you set the verbose options to see what the problem is?  Maybe the
> problem would be solved by putting virtual report at the top of the rule.
> But it might still fail because nothing can happen without a value for the
> virtual metavariable ns.

diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/coccinelle/misc/add_namespace.cocci
index c832bb6445a8..99e93a6c2e24 100644
--- a/scripts/coccinelle/misc/add_namespace.cocci
+++ b/scripts/coccinelle/misc/add_namespace.cocci
@@ -6,6 +6,8 @@
 /// add a missing namespace tag to a module source file.
 ///

+virtual report
+
 @has_ns_import@
 declarer name MODULE_IMPORT_NS;
 identifier virtual.ns;



Adding virtual report make the coccicheck go ahead smoothly.

> 
> Should the coccinelle directory be only for things that work with make
> coccicheck, or for all Coccinelle scripts?
> 
> julia
> 
> .
> 

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
