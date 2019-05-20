Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D72418F
	for <lists+cocci@lfdr.de>; Mon, 20 May 2019 21:54:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4KJrj00011386;
	Mon, 20 May 2019 21:53:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 452F57758;
	Mon, 20 May 2019 21:53:45 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3BB49768D
 for <cocci@systeme.lip6.fr>; Mon, 20 May 2019 21:53:42 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4KJrfQK016525
 for <cocci@systeme.lip6.fr>; Mon, 20 May 2019 21:53:41 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,492,1549926000"; d="scan'208";a="306653735"
Received: from abo-218-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.218])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 21:53:41 +0200
Date: Mon, 20 May 2019 21:53:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Sasha Levin <sashal@kernel.org>
In-Reply-To: <20190520172041.GH11972@sasha-vm>
Message-ID: <alpine.DEB.2.21.1905202151140.2561@hadrien>
References: <201905171432571474636@zte.com.cn>
 <alpine.DEB.2.20.1905170912590.4014@hadrien>
 <20190520093303.GA9320@atrey.karlin.mff.cuni.cz>
 <alpine.DEB.2.21.1905201152040.2543@hadrien>
 <20190520172041.GH11972@sasha-vm>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 20 May 2019 21:53:47 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 20 May 2019 21:53:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: michal.lkml@markovi.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr,
        Markus.Elfring@web.de, Pavel Machek <pavel@ucw.cz>,
        wen.yang99@zte.com.cn
Subject: Re: [Cocci] Coccinelle: semantic patch for missing of_node_put
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



On Mon, 20 May 2019, Sasha Levin wrote:

> On Mon, May 20, 2019 at 11:52:37AM +0200, Julia Lawall wrote:
> >
> >
> > On Mon, 20 May 2019, Pavel Machek wrote:
> >
> > > Hi!
> > >
> > > > A semantic patch has no access to comments.  The only thing I can see to
> > > > do is to use python to interact with some external tools.  For example,
> > > > you could write some code to collect the comments in a file and the
> > > lines
> > > > on which they occur, and then get the comment that most closely precedes
> > > > the start of the function.
> > >
> > > How dangerous is missing of_node_put? AFAICT it will only result into
> > > very small, one-time memory leak, right?
> > >
> > > Could we make sure these patches are _not_ going to stable? Leaking
> > > few bytes once per boot is not really a serious bug.
> >
> > Sasha,
> >
> > Probably patches that add only of_node_put should not be auto selected for
> > stable.
>
> I can filter them out, but those are fixes, right? Why are we concerned
> about them making it into -stable?

One of them may have introduced a crash.  If there is a bad reference
count manipulation elsewhere, then fixing one could cause a later
incorrect one to make a double free.

On the other hand, I don't know if the one that seemed to cause a crash
really caused a crash.  It was detected by syzkaller, and it is also
possible that git bisect ended up at the wrong place.

In any case, forgetting an of_node_put will normally just waste a little
memory, so probably stable kernels don't care.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
