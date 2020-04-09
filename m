Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1BB1A32DC
	for <lists+cocci@lfdr.de>; Thu,  9 Apr 2020 12:54:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 039Arvft027474;
	Thu, 9 Apr 2020 12:53:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D6D76782A;
	Thu,  9 Apr 2020 12:53:57 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 87A9F7815
 for <cocci@systeme.lip6.fr>; Thu,  9 Apr 2020 12:53:55 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 039ArsPR022174
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 9 Apr 2020 12:53:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580770800"; d="scan'208";a="444554909"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:53:54 +0200
Date: Thu, 9 Apr 2020 12:53:54 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Alexander Popov <alex.popov@linux.com>
In-Reply-To: <fff664e9-06c9-d2fb-738f-e8e591e09569@linux.com>
Message-ID: <alpine.DEB.2.21.2004091248190.2403@hadrien>
References: <fff664e9-06c9-d2fb-738f-e8e591e09569@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 09 Apr 2020 12:53:59 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 09 Apr 2020 12:53:54 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
        "kernel-hardening@lists.openwall.com"
 <kernel-hardening@lists.openwall.com>,
        jannh@google.com, Nicolas Palix <nicolas.palix@imag.fr>,
        LKML <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, cocci@systeme.lip6.fr,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Cocci] Coccinelle rule for CVE-2019-18683
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



On Thu, 9 Apr 2020, Alexander Popov wrote:

> Hello!
>
> Some time ago I fixed CVE-2019-18683 in the V4L2 subsystem of the Linux kernel.
>
> I created a Coccinelle rule that detects that bug pattern. Let me show it.

Thanks for the discussion :)

>
>
> Bug pattern
> ===========
>
> CVE-2019-18683 refers to three similar vulnerabilities caused by the same
> incorrect approach to locking that is used in vivid_stop_generating_vid_cap(),
> vivid_stop_generating_vid_out(), and sdr_cap_stop_streaming().
>
> For fixes please see the commit 6dcd5d7a7a29c1e4 (media: vivid: Fix wrong
> locking that causes race conditions on streaming stop).
>
> These three functions are called during streaming stopping with vivid_dev.mutex
> locked. And they all do the same mistake while stopping their kthreads, which
> need to lock this mutex as well. See the example from
> vivid_stop_generating_vid_cap():
>     /* shutdown control thread */
>     vivid_grab_controls(dev, false);
>     mutex_unlock(&dev->mutex);
>     kthread_stop(dev->kthread_vid_cap);
>     dev->kthread_vid_cap = NULL;
>     mutex_lock(&dev->mutex);
>
> But when this mutex is unlocked, another vb2_fop_read() can lock it instead of
> the kthread and manipulate the buffer queue. That causes use-after-free.
>
> I created a Coccinelle rule that detects mutex_unlock+kthread_stop+mutex_lock
> within one function.
>
>
> Coccinelle rule
> ===============
>
> virtual report
>
> @race exists@
> expression E;
> position stop_p;
> position unlock_p;
> position lock_p;
> @@
>
> mutex_unlock@unlock_p(E)
> ...

It would be good to put when != mutex_lock(E) after the ... above.  Your
rule doesn't actually prevent the lock from being retaken.

> kthread_stop@stop_p(...)
> ...
> mutex_lock@lock_p(E)
>
> @script:python@
> stop_p << race.stop_p;
> unlock_p << race.unlock_p;
> lock_p << race.lock_p;
> E << race.E;
> @@
>
> coccilib.report.print_report(unlock_p[0], 'mutex_unlock(' + E + ') here')
> coccilib.report.print_report(stop_p[0], 'kthread_stop here')
> coccilib.report.print_report(lock_p[0], 'mutex_lock(' + E + ') here\n')
>
>
> Testing the rule
> ================
>
> I reverted the commit 6dcd5d7a7a29c1e4 and called:
> COCCI=./scripts/coccinelle/kthread_race.cocci make coccicheck MODE=report
>
> The result:
>
> ./drivers/media/platform/vivid/vivid-kthread-out.c:347:1-13: mutex_unlock(& dev
> -> mutex) here
> ./drivers/media/platform/vivid/vivid-kthread-out.c:348:1-13: kthread_stop here
> ./drivers/media/platform/vivid/vivid-kthread-out.c:350:1-11: mutex_lock(& dev ->
> mutex) here
>
> ./drivers/media/platform/vivid/vivid-sdr-cap.c:306:1-13: mutex_unlock(& dev ->
> mutex) here
> ./drivers/media/platform/vivid/vivid-sdr-cap.c:307:1-13: kthread_stop here
> ./drivers/media/platform/vivid/vivid-sdr-cap.c:309:1-11: mutex_lock(& dev ->
> mutex) here
>
> ./drivers/media/platform/vivid/vivid-kthread-cap.c:1001:1-13: mutex_unlock(& dev
> -> mutex) here
> ./drivers/media/platform/vivid/vivid-kthread-cap.c:1002:1-13: kthread_stop here
> ./drivers/media/platform/vivid/vivid-kthread-cap.c:1004:1-11: mutex_lock(& dev
> -> mutex) here
>
> There are no other bugs detected.
>
> Do you have any idea how to improve it?
> Do we need that rule for regression testing in the upstream?

Based on Jann's suggestion, it seem like it could be interesting to find
these locking pauses, and then collect functions that are used in locks
and in lock pauses.  If a function is mostly used with locks held, then
using it in a lock pause could be a sign of a bug.  I will see if it turns
up anything interesting.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
