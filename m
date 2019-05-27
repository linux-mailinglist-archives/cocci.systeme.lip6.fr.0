Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 880062B480
	for <lists+cocci@lfdr.de>; Mon, 27 May 2019 14:11:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4RCBJpX016665;
	Mon, 27 May 2019 14:11:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E8ADC7762;
	Mon, 27 May 2019 14:11:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C0C5B7747
 for <cocci@systeme.lip6.fr>; Mon, 27 May 2019 14:11:17 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4RCBH91027501
 for <cocci@systeme.lip6.fr>; Mon, 27 May 2019 14:11:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; d="scan'208";a="307318089"
Received: from unknown (HELO hadrien) ([207.96.196.254])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 14:11:16 +0200
Date: Mon, 27 May 2019 08:11:15 -0400 (EDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Lennart Glauer <lennart.glauer@gmail.com>
In-Reply-To: <246F5E26-E77D-4283-9927-952D07BA42BF@gmail.com>
Message-ID: <alpine.DEB.2.21.1905270807270.2513@hadrien>
References: <246F5E26-E77D-4283-9927-952D07BA42BF@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1780329147-1558959076=:2513"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 May 2019 14:11:20 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 27 May 2019 14:11:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Question: Removing a function argument
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1780329147-1558959076=:2513
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 27 May 2019, Lennart Glauer wrote:

> Hello all,
>
> I’m interested in using Coccinelle.
> Currently I’m playing with the example „Removing a function argument":
> http://coccinelle.lip6.fr/docs/main_grammar016.html#sec24 <http://coccinelle.lip6.fr/docs/main_grammar016.html#sec24>
>
> It works well with drivers/atm/firestream.c,
> but if the definition of the function and the call are in two different files it doesn’t work anymore.
> It seems that the reference „rule1.fn“ doesn’t work across files?
> I created a minimal testcase (see attachment).
> Is there any way to make this work?

Coccinelle normally works on one file at a time.  If you put more file
names on the command line they will all be precessed at once, so both the
definition and use will be seen.  However, it is not advisable to put the
names of all of the files of the Linux kernel on the command line.  You
will run out fo memory having the representations of all of the files in
memory at the same time.

Afterwards, the choices are to use iteration (demos/iteration.cocci) to
find the definition and then find the calls.

Alternatively, if you know of some groups of files that should be treated
at once, you can put then in a file with one file per line, with the
groups separated by newlines, eg

file1
file2

file3
file4
file5

and then pass the name of this file to Coccinelle with the name
--file-groups.

julia
--8323329-1780329147-1558959076=:2513
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1780329147-1558959076=:2513--
