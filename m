Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6D826348
	for <lists+cocci@lfdr.de>; Wed, 22 May 2019 13:56:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4MBtUVN029726;
	Wed, 22 May 2019 13:55:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 97E6C7759;
	Wed, 22 May 2019 13:55:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8EACB7747
 for <cocci@systeme.lip6.fr>; Wed, 22 May 2019 13:55:28 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4MBtSfa000952
 for <cocci@systeme.lip6.fr>; Wed, 22 May 2019 13:55:28 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,499,1549926000"; d="scan'208";a="306855893"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 13:55:27 +0200
Date: Wed, 22 May 2019 13:55:27 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <ae3c7e1d-92ab-13d1-edfa-796e520909ab@linbit.com>
Message-ID: <alpine.DEB.2.20.1905221353000.4390@hadrien>
References: <86fdc128-e077-58d1-2170-912937317ab1@linbit.com>
 <alpine.DEB.2.20.1905221330110.4390@hadrien>
 <ae3c7e1d-92ab-13d1-edfa-796e520909ab@linbit.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1955471120-1558526024=:4390"
Content-ID: <alpine.DEB.2.20.1905221354220.4390@hadrien>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 22 May 2019 13:55:30 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 22 May 2019 13:55:28 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Does coccinelle support non-standard C?
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

--8323329-1955471120-1558526024=:4390
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.20.1905221354221.4390@hadrien>



On Wed, 22 May 2019, Christoph Böhmwalder wrote:

> On 22.05.19 13:37, Julia Lawall wrote:
> > Is it always exactly this string that you want to add?
>
> In my case, yes. I don't have any metavariable substitutions, etc; it's always
> the same constant code.

You can do the following

@script:python b@
x;
@@

coccinelle.x = "({...})"    <--- The code you want

@@
identifier b.i;
@@
- cocci_replace_this()
+ i

julia

--8323329-1955471120-1558526024=:4390
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1955471120-1558526024=:4390--
